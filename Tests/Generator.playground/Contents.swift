import Foundation
import XCPlayground

func createEnumCaseFromLine(line: String) -> Case? {
    
    func createCommentsFromReference(reference: String?) -> [String]? {
        
        func createRFCSeeAlso(link: String) -> String? {
            let values = link.components(separatedBy: ", ")
            guard let spec = values.first else {
                return nil
            }
            let components = NSURLComponents(string: spec.lowercased())!
            if values.count == 2 {
                components.fragment = values[1].lowercased().replacingOccurrences(of: " ", with: "-")
            }
            let url = components.url(relativeTo: URL(string: "http://www.iana.org/go/"))!
            return createSeeAlso(text: link, link: url.absoluteString)
        }
        
        guard let reference = reference else {
            return nil
        }
        
        let refsRegex = try! NSRegularExpression(pattern: "\\[([^\\]]+)\\]")
        
        return refsRegex.matches(in: reference, options: [], range: NSRange(location: 0, length: (reference as NSString).length)).flatMap { result in
            guard result.numberOfRanges == 2 else {
                return nil
            }
            return createRFCSeeAlso(link: (reference as NSString).substring(with: result.range(at: 1)))
        }
    }
    
    let linesRegex = try! NSRegularExpression(pattern: "^([^,]*),([^,]*),\"?([^\"$]*)\"?", options: [])
    guard let match = linesRegex.firstMatch(in: line, range: NSRange(location: 0, length: (line as NSString).length)), match.numberOfRanges == 4 else {
        return nil
    }
    
    let codeRange = match.range(at: 1)
    let infoRange = match.range(at: 2)
    let refRange = match.range(at: 3)

    let codeString = (line as NSString).substring(with: codeRange)
    let info = (line as NSString).substring(with: infoRange)
    let ref: String? = refRange.location != NSNotFound ? (line as NSString).substring(with: refRange) : nil
    
    guard let code = Int(codeString, radix: 10) else {
        return nil
    }
    guard info.lowercased() != "unassigned" else {
        return nil
    }
    
    return Case(code: code, name: info, comments: createCommentsFromReference(reference: ref) ?? [])
}

func fetchCSV() -> (lastUpdated: String, cases: Set<Case>)? {
    
    let semaphore = DispatchSemaphore(value: 0)
    var result: (String, Set<Case>)?
    
    let task = URLSession.shared.dataTask(with: URL(string: "http://www.iana.org/assignments/http-status-codes/http-status-codes-1.csv")!) { data, response, error in
        defer { semaphore.signal() }

        if let error = error {
            print("Error fetching CSV: \(error)")
            return
        }
        let response = response as! HTTPURLResponse
        guard let lastUpdated = response.allHeaderFields["Last-Modified"] as! String? else {
            print("No Last-Modified header value")
            return
        }
        guard let d = data, let string = String(data: d, encoding: .utf8) else {
            print("Unable to decode data: \(String(describing: data))")
            return
        }
        
        var cases = Set<Case>()
        string.enumerateLines{ line, _ in
            if let c = createEnumCaseFromLine(line: line) {
                cases.insert(c)
            }
        }
        result = (lastUpdated, cases)
    }
    task.resume()
    if semaphore.wait(timeout: DispatchTime.now() + .seconds(10)) != .success {
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
    cases.formUnion(ExtraCases)
    print(FileHeader)
    print()
    print(Imports)
    print()
    print(createEnumHeaderComment(lastUpdated: lastUpdated))
    print(EnumDeclarationStart)
    print()
    print(cases.sorted().map(String.init(describing:)).joined(separator: "\n\n"))
    print(EnumDeclarationEnd)
    print()
}
