import Foundation
import XCPlayground

func createEnumCaseFromLine(line: String) -> Case? {
    
    func createCommentsFromReference(reference: String?) -> [String]? {
        
        func createRFCSeeAlso(link: String) -> String? {
            let values = link.componentsSeparatedByString(", ")
            guard let spec = values.first else {
                return nil
            }
            let components = NSURLComponents(string: spec.lowercaseString)!
            if values.count == 2 {
                components.fragment = values[1].lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "-")
            }
            let URL = components.URLRelativeToURL(NSURL(string: "http://www.iana.org/go/"))!
            return createSeeAlso(link, link: URL.absoluteString)
        }
        
        guard let reference = reference else {
            return nil
        }
        
        let refsRegex = try! NSRegularExpression(pattern: "\\[([^\\]]+)\\]", options: [])
        
        return refsRegex.matchesInString(reference, options: [], range: NSRange(location: 0, length: (reference as NSString).length)).flatMap { result in
            guard result.numberOfRanges == 2 else {
                return nil
            }
            return createRFCSeeAlso((reference as NSString).substringWithRange(result.rangeAtIndex(1)))
        }
    }
    
    let linesRegex = try! NSRegularExpression(pattern: "^([^,]*),([^,]*),\"?([^\"$]*)\"?", options: [])
    guard let match = linesRegex.firstMatchInString(line, options: [], range: NSRange(location: 0, length: (line as NSString).length)) where match.numberOfRanges == 4 else {
        return nil
    }
    
    let codeRange = match.rangeAtIndex(1)
    let infoRange = match.rangeAtIndex(2)
    let refRange = match.rangeAtIndex(3)

    let codeString = (line as NSString).substringWithRange(codeRange)
    let info = (line as NSString).substringWithRange(infoRange)
    let ref: String? = refRange.location != NSNotFound ? (line as NSString).substringWithRange(refRange) : nil
    
    guard let code = Int(codeString, radix: 10) else {
        return nil
    }
    guard info.lowercaseString != "unassigned" else {
        return nil
    }
    
    return Case(code: code, name: info, comments: createCommentsFromReference(ref) ?? [])
}

func fetchCSV() -> (lastUpdated: String, cases: Set<Case>)? {
    
    let semaphore = dispatch_semaphore_create(0)
    var result: (String, Set<Case>)?
    
    let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: "http://www.iana.org/assignments/http-status-codes/http-status-codes-1.csv")!) { data, response, error in
        defer { dispatch_semaphore_signal(semaphore) }

        if let error = error {
            print("Error fetching CSV: \(error)")
            return
        }
        let response = response as! NSHTTPURLResponse
        guard let lastUpdated = response.allHeaderFields["Last-Modified"] as! String? else {
            print("No Last-Modified header value")
            return
        }
        guard let d = data, string = String(data: d, encoding: NSUTF8StringEncoding) else {
            print("Unable to decode data: \(data)")
            return
        }
        
        var cases = Set<Case>()
        string.enumerateLines{ line, _ in
            if let c = createEnumCaseFromLine(line) {
                cases.insert(c)
            }
        }
        result = (lastUpdated, cases)
    }
    task.resume()
    if dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, Int64(10 * NSTimeInterval(NSEC_PER_SEC)))) != 0 {
        task.cancel()
        print("Timeout waiting for task to complete")
    }
    return result
}

let CodeBlacklist = [
    306 // Declared as (Unused) in CSV
]

if let (lastUpdated, allCases) = fetchCSV() {
    var cases = allCases.filter { !CodeBlacklist.contains($0.code) }
    cases.appendContentsOf(ExtraCases)
    print(FileHeader)
    print()
    print(Imports)
    print()
    print(createEnumHeaderComment(lastUpdated))
    print(EnumDeclarationStart)
    print()
    print(cases.sort().map({ String($0) }).joinWithSeparator("\n\n"))
    print(EnumDeclarationEnd)
    print()
    print(EnumExtension)
}
