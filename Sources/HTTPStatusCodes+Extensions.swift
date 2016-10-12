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
        return isIn(range: 100...199)
    }
    /// Success - The action was successfully received, understood, and accepted.
    public var isSuccess: Bool {
        return isIn(range: 200...299)
    }
    /// Redirection - Further action must be taken in order to complete the request.
    public var isRedirection: Bool {
        return isIn(range: 300...399)
    }
    /// Client Error - The request contains bad syntax or cannot be fulfilled.
    public var isClientError: Bool {
        return isIn(range: 400...499)
    }
    /// Server Error - The server failed to fulfill an apparently valid request.
    public var isServerError: Bool {
        return isIn(range: 500...599)
    }
    
    /// - returns: `true` if the status code is in the provided range, false otherwise.
    private func isIn(range: ClosedRange<HTTPStatusCode.RawValue>) -> Bool {
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

    /// This is declared as it's not automatically picked up by the complier for the above init
    private init?(_ rawValue: Int) {
        guard let value = HTTPStatusCode(rawValue: rawValue) else {
            return nil
        }
        self = value
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
    public convenience init?(url: URL, statusCode: HTTPStatusCode, httpVersion: String?, headerFields: [String : String]?) {
        self.init(url: url, statusCode: statusCode.rawValue, httpVersion: httpVersion, headerFields: headerFields)
    }
}

// MARK: - Deprecated cases

public extension HTTPStatusCode {
    
    /// - deprecated: Renamed to `payloadTooLarge`
    @available(*, deprecated, renamed: "payloadTooLarge")
    static let requestEntityTooLarge = payloadTooLarge
    
    /// - deprecated: Renamed to `uriTooLong`
    @available(*, deprecated, renamed: "uriTooLong")
    static let requestURITooLong = uriTooLong
    
    /// - deprecated: Renamed to `rangeNotSatisfiable`
    @available(*, deprecated, renamed: "rangeNotSatisfiable")
    static let requestedRangeNotSatisfiable = rangeNotSatisfiable
    
    /// - deprecated: Renamed to `iisLoginTimeout`
    @available(*, deprecated, renamed: "iisLoginTimeout")
    static let loginTimeout = iisLoginTimeout
    
    /// - deprecated: Renamed to `iisRetryWith`
    @available(*, deprecated, renamed: "iisRetryWith")
    static let retryWith = iisRetryWith
    
    /// - deprecated: Renamed to `nginxNoResponse`
    @available(*, deprecated, renamed: "nginxNoResponse")
    static let noResponse = nginxNoResponse
    
    /// - deprecated: Renamed to `nginxSSLCertificateError`
    @available(*, deprecated, renamed: "nginxSSLCertificateError")
    static let certError = nginxSSLCertificateError
    
    /// - deprecated: Renamed to `nginxSSLCertificateRequired`
    @available(*, deprecated, renamed: "nginxSSLCertificateRequired")
    static let noCert = nginxSSLCertificateRequired
    
    /// - deprecated: Renamed to `nginxHTTPToHTTPS`
    @available(*, deprecated, renamed: "nginxHTTPToHTTPS")
    static let httpToHTTPS = nginxHTTPToHTTPS
    
    /// - deprecated: Renamed to `nginxClientClosedRequest`
    @available(*, deprecated, renamed: "nginxClientClosedRequest")
    static let clientClosedRequest = nginxClientClosedRequest
    
    /// Returned by version 1 of the Twitter Search and Trends API when the client is being rate limited; versions 1.1 and later use the 429 Too Many Requests (`tooManyRequests`) response code instead.
    ///
    /// - seealso: [Twitter Error Codes & Responses](https://dev.twitter.com/docs/error-codes-responses)
    @available(*, deprecated, renamed: "tooManyRequests")
    static let twitterEnhanceYourCalm = tooManyRequests
}

public extension HTTPURLResponse {
    
    /// - deprecated: Renamed to `init(url:statusCode:httpVersion:headerFields)` to correct Swift 3 naming convention.
    @available(*, deprecated, renamed: "init(url:statusCode:httpVersion:headerFields:)", message: "Renamed to correct Swift 3 naming convention")
    @nonobjc
    public convenience init?(url: URL, statusCode: HTTPStatusCode, HTTPVersion: String?, headerFields: [String : String]?) {
        self.init(url: url, statusCode: statusCode, httpVersion: HTTPVersion, headerFields: headerFields)
    }
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
    static let switchProxy = __Unavailable
    
    /// Authentication Timeout: 419
    ///
    /// Removed from Wikipedia page.
    @available(*, unavailable, message: "No longer available")
    static let authenticationTimeout = __Unavailable
    
    /// Method Failure: 419
    ///
    /// A deprecated response used by the Spring Framework when a method has failed.
    ///
    /// - seealso: [Spring Framework: HttpStatus enum documentation - `METHOD_FAILURE`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/HttpStatus.html#METHOD_FAILURE)
    @available(*, unavailable, message: "Deprecated")
    static let springFrameworkMethodFailure = __Unavailable
    
    /// Request Header Too Large: 494
    ///
    /// Removed and replaced with `RequestHeaderFieldsTooLarge` - 431
    @available(*, unavailable, renamed: "requestHeaderFieldsTooLarge", message: "Changed to a 431 status code")
    static let requestHeaderTooLarge = __Unavailable
    
    /// Network Timeout Error: 599
    ///
    /// Removed from Wikipedia page.
    @available(*, unavailable, message: "No longer available")
    static let networkTimeoutError = __Unavailable
}
