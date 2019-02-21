public struct Case {
    public let code: Int
    let name: String
    let comments: [String]
    let caseName: String
    let objCCaseName: String?
    
    init(code: Int, name: String, comments: String...) {
        self.init(code: code, name: name, comments: comments)
    }
    
    public init(code: Int, name: String, comments: [String]) {
        self.code = code
        self.name = name
        self.comments = ["\(name): \(code)", ""] + comments
        // Remove all non code print characters, interpret '-' as a space
        let identifiers = (SpecialCaseNameLookup[code] ?? name).replacingOccurrences(of: "\\-", with: " ", options: [.caseInsensitive, .regularExpression]).replacingOccurrences(of: "[^a-z0-9 ]", with: "", options: [.caseInsensitive, .regularExpression]).components(separatedBy: " ")
        
        // Must always have at least 1 value for the identifiers
        let prefix = identifiers.first!
        // Match Swift 3.0 enum case naming convention
        let swiftCaseNamePrefix = prefix.lowercased()
        let swiftCaseNameSuffix = (identifiers.count > 1 ? identifiers.suffix(from: 1).map { $0.uppercasedFirstCharacter() } : []).joined(separator: "")
        
        let swiftCaseName = swiftCaseNamePrefix + swiftCaseNameSuffix
        // Keep acronyms if its the first identifier
        objCCaseName = prefix.uppercased() == prefix ? (prefix + swiftCaseNameSuffix) : nil
        
        // Escape special case names
        caseName = UnsafeCaseNames.contains(swiftCaseName) ? "`\(swiftCaseName)`" : swiftCaseName
    }
}

extension Case: Hashable, Comparable, CustomStringConvertible {
    public var hashValue: Int { return code.hashValue }
    
    public var description: String {
        var lines = [makeLinesIntoDocComment(lines: comments, prefix: "\t")]
        if let objCCaseName = objCCaseName {
            lines.append("\t@objc(\(EnumName)\(objCCaseName))")
        }
        lines.append("\tcase \(caseName) = \(code)")
        return text(lines)
    }
    
    public static func ==(lhs: Case, rhs: Case) -> Bool { return lhs.code == rhs.code }
    public static func <(lhs: Case, rhs: Case) -> Bool { return lhs.code < rhs.code }
}

private extension String {
    
    func lowercasedFirstCharacter() -> String {
        let firstCharacter = String(self[startIndex])
        let rest = self[index(after: startIndex)...]
        return firstCharacter.lowercased() + rest
    }
    
    func uppercasedFirstCharacter() -> String {
        let firstCharacter = String(self[startIndex])
        let rest = self[index(after: startIndex)...]
        return firstCharacter.uppercased() + rest
    }
}

/// List of Swift keywords
private let UnsafeCaseNames = Set(arrayLiteral:
    "continue",
    "break",
    "fallthrough­",
    "return",
    "guard",
    "if",
    "else",
    "switch",
    "default",
    "for",
    "while",
    "repeat",
    "do",
    "try",
    "catch",
    "throw",
    "defer",
    "func",
    "throws",
    "rethrows",
    "struct",
    "class",
    "extension",
    "enum",
    "protocol",
    "typealias­",
    "associatedtype­",
    "public",
    "internal",
    "private",
    "final",
    "open",
    "var",
    "let",
    "case",
    "indirect",
    "self",
    "static",
    "as",
    "is",
    "weak",
    "unowned",
    "in",
    "where",
    "get",
    "set",
    "willSet",
    "didSet",
    "init",
    "deinit",
    "subscript­",
    "operator",
    "postfix",
    "prefix",
    "infix",
    "convenience­",
    "dynamic­",
    "­infix­",
    "lazy­",
    "mutating­",
    "nonmutating­",
    "optional­",
    "override­",
    "required"
)
