public struct Case {
    public let code: Int
    let name: String
    let comments: [String]
    let caseName: String
    
    init(code: Int, name: String, comments: String...) {
        self.init(code: code, name: name, comments: comments)
    }
    
    public init(code: Int, name: String, comments: [String]) {
        self.code = code
        self.name = name
        self.comments = ["\(name): \(code)", ""] + comments
        caseName = name.stringByReplacingOccurrencesOfString("[^a-z0-9 ]", withString: "", options: [.CaseInsensitiveSearch, .RegularExpressionSearch]).componentsSeparatedByString(" ").map {
            String($0[$0.startIndex]).uppercaseString + $0.substringFromIndex($0.startIndex.advancedBy(1))
        }.joinWithSeparator("")
    }
}

extension Case: Hashable, Comparable, CustomStringConvertible {
    public var hashValue: Int { return code.hashValue }
    public var description: String {
        return [
            makeLinesIntoDocComment(comments, prefix: "\t"),
            "\tcase \(caseName) = \(code)"
        ].joinWithSeparator("\n")
    }
}

public func ==(lhs: Case, rhs: Case) -> Bool { return lhs.code == rhs.code }
public func <(lhs: Case, rhs: Case) -> Bool { return lhs.code < rhs.code }

struct Deprecated {
    let renamedTo: String?
    
    init(renamedTo: String? = nil) {
        self.renamedTo = renamedTo
    }
}

extension Deprecated: CustomStringConvertible {
    var description: String {
        var s = "@available(*, deprecated"
        if let renamedTo = renamedTo {
            s += ", renamed=\"\(renamedTo)\")"
        }
        s += ")"
        return "\t\(s)"
    }
}
