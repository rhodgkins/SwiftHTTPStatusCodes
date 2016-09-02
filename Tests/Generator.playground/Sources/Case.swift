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
        let identifiers = (SpecialCaseNameLookup[code] ?? name).replacingOccurrences(of: "[^a-z0-9 ]", with: "", options: [.caseInsensitive, .regularExpression]).components(separatedBy: " ")
        caseName = identifiers.enumerated().map {
            // Match Swift 3.0 enum case naming convention
            return $0 == identifiers.startIndex ? $1.lowercasedFirstCharacter() : $1.uppercasedFirstCharacter()
        }.joined(separator: "")
    }
}

extension Case: Hashable, Comparable, CustomStringConvertible {
    public var hashValue: Int { return code.hashValue }
    public var description: String {
        return text(
            makeLinesIntoDocComment(lines: comments, prefix: "\t"),
            "\tcase \(caseName) = \(code)"
        )
    }
    
    public static func ==(lhs: Case, rhs: Case) -> Bool { return lhs.code == rhs.code }
    public static func <(lhs: Case, rhs: Case) -> Bool { return lhs.code < rhs.code }
}


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
            s += ", renamed: \"\(renamedTo)\")"
        }
        s += ")"
        return "\t\(s)"
    }
}

private extension String {
    
    func lowercasedFirstCharacter() -> String {
        let firstCharacter = String(self[startIndex])
        let rest = substring(from: index(after: startIndex))
        return firstCharacter.lowercased() + rest.lowercased()
    }
    
    func uppercasedFirstCharacter() -> String {
        let firstCharacter = String(self[startIndex])
        let rest = substring(from: index(after: startIndex))
        return firstCharacter.uppercased() + rest
    }
}
