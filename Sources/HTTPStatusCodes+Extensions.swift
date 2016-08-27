//
//  HTTPStatusCodes+Extensions.swift
//  HTTPStatusCodes
//
//  Created by Richard Hodgkins on 07/06/2016.
//  Copyright © 2016 Rich H. All rights reserved.
//

import Foundation

public extension HTTPStatusCode {
    /// Informational - Request received, continuing process.
    public var isInformational: Bool {
        return inRange(100...199)
    }
    /// Success - The action was successfully received, understood, and accepted.
    public var isSuccess: Bool {
        return inRange(200...299)
    }
    /// Redirection - Further action must be taken in order to complete the request.
    public var isRedirection: Bool {
        return inRange(300...399)
    }
    /// Client Error - The request contains bad syntax or cannot be fulfilled.
    public var isClientError: Bool {
        return inRange(400...499)
    }
    /// Server Error - The server failed to fulfill an apparently valid request.
    public var isServerError: Bool {
        return inRange(500...599)
    }
    
    /// - returns: `true` if the status code is in the provided range, false otherwise.
    private func inRange(_ range: ClosedRange<HTTPStatusCode.RawValue>) -> Bool {
        return range.contains(rawValue)
    }
}

public extension HTTPStatusCode {
    /// - returns: a localized string suitable for displaying to users that describes the specified status code.
    public var localizedReasonPhrase: String {
        return HTTPURLResponse.localizedString(forStatusCode: rawValue)
    }
}

// MARK: - Printing

extension HTTPStatusCode: CustomDebugStringConvertible, CustomStringConvertible {
    public var description: String {
        return "\(rawValue) - \(localizedReasonPhrase)"
    }
    public var debugDescription: String {
        return "HTTPStatusCode:\(description)"
    }
}

// MARK: - HTTP URL Response

public extension HTTPStatusCode {
    
    /// Obtains a possible status code from an optional HTTP URL response.
    public init?(HTTPResponse: HTTPURLResponse?) {
        guard let statusCodeValue = HTTPResponse?.statusCode else {
            return nil
        }
        self.init(statusCodeValue)
    }
}

public extension HTTPURLResponse {
    
    /**
     * Marked internal to expose (as `statusCodeValue`) for Objective-C interoperability only.
     *
     * - returns: the receiver’s HTTP status code.
     */
    @objc(statusCodeValue) var statusCodeEnum: HTTPStatusCode {
        return HTTPStatusCode(HTTPResponse: self)!
    }
    
    /// - returns: the receiver’s HTTP status code.
    public var statusCodeValue: HTTPStatusCode? {
        return HTTPStatusCode(HTTPResponse: self)
    }
    
    /**
     * Initializer for NSHTTPURLResponse objects.
     *
     * - parameter url: the URL from which the response was generated.
     * - parameter statusCode: an HTTP status code.
     * - parameter HTTPVersion: the version of the HTTP response as represented by the server.  This is typically represented as "HTTP/1.1".
     * - parameter headerFields: a dictionary representing the header keys and values of the server response.
     *
     * - returns: the instance of the object, or `nil` if an error occurred during initialization.
     */
    @available(iOS, introduced: 7.0)
    @objc(initWithURL:statusCodeValue:HTTPVersion:headerFields:)
    public convenience init?(URL url: URL, statusCode: HTTPStatusCode, HTTPVersion: String?, headerFields: [String : String]?) {
        self.init(url: url, statusCode: statusCode.rawValue, httpVersion: HTTPVersion, headerFields: headerFields)
    }
}

// MARK: - Deprecated cases

public extension HTTPStatusCode {
    
    @available(*, deprecated, renamed: "PayloadTooLarge")
    static let RequestEntityTooLarge = payloadTooLarge
    
    @available(*, deprecated, renamed: "URITooLong")
    static let RequestURITooLong = uriTooLong
    
    @available(*, deprecated, renamed: "RangeNotSatisfiable")
    static let RequestedRangeNotSatisfiable = rangeNotSatisfiable
    
    @available(*, deprecated, renamed: "IISLoginTimeout")
    static let LoginTimeout = iisLoginTimeout
    
    @available(*, deprecated, renamed: "IISRetryWith")
    static let RetryWith = iisRetryWith
    
    @available(*, deprecated, renamed: "NginxNoResponse")
    static let NoResponse = nginxNoResponse
    
    @available(*, deprecated, renamed: "NginxSSLCertificateError")
    static let CertError = nginxSSLCertificateError
    
    @available(*, deprecated, renamed: "NginxSSLCertificateRequired")
    static let NoCert = nginxSSLCertificateRequired
    
    @available(*, deprecated, renamed: "NginxHTTPToHTTPS")
    static let HTTPToHTTPS = nginxHTTPToHTTPS
    
    @available(*, deprecated, renamed: "NginxClientClosedRequest")
    static let ClientClosedRequest = nginxClientClosedRequest
    
    /// Returned by version 1 of the Twitter Search and Trends API when the client is being rate limited; versions 1.1 and later use the 429 Too Many Requests response code instead.
    ///
    /// - seealso: [Twitter Error Codes & Responses](https://dev.twitter.com/docs/error-codes-responses)
    @available(*, deprecated, renamed: "TooManyRequests")
    static let TwitterEnhanceYourCalm = tooManyRequests
}

// MARK: - Remove cases

/// Declared here for a cleaner API with no `!` types.
private let __Unavailable: HTTPStatusCode! = nil

public extension HTTPStatusCode {
    
    /// Switch Proxy: 306
    ///
    /// No longer used. Originally meant "Subsequent requests should use the specified proxy."
    ///
    /// - seealso: [Original draft](https://tools.ietf.org/html/draft-cohen-http-305-306-responses-00)
    @available(*, unavailable, message: "No longer used")
    static let SwitchProxy = __Unavailable
    
    /// Authentication Timeout: 419
    ///
    /// Removed from Wikipedia page.
    @available(*, unavailable, message: "No longer available")
    static let AuthenticationTimeout = __Unavailable
    
    /// Method Failure: 419
    ///
    /// A deprecated response used by the Spring Framework when a method has failed.
    ///
    /// - seealso: [Spring Framework: HttpStatus enum documentation - `METHOD_FAILURE`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/HttpStatus.html#METHOD_FAILURE)
    @available(*, unavailable, message: "Deprecated")
    static let SpringFrameworkMethodFailure = __Unavailable
    
    /// Request Header Too Large: 494
    ///
    /// Removed and replaced with `RequestHeaderFieldsTooLarge` - 431
    @available(*, unavailable, renamed: "RequestHeaderFieldsTooLarge", message: "Changed to a 431 status code")
    static let RequestHeaderTooLarge = __Unavailable
    
    /// Network Timeout Error: 599
    ///
    /// Removed from Wikipedia page.
    @available(*, unavailable, message: "No longer available")
    static let NetworkTimeoutError = __Unavailable
}
