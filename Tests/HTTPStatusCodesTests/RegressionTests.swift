//
//  RegressionTests.swift
//  HTTPStatusCodes
//
//  Created by Richard Hodgkins on 07/06/2016.
//  Copyright © 2016 Rich H. All rights reserved.
//

import XCTest

#if os(watchOS)
// No testing supported
@testable import HTTPStatusCodes
#else
    
import XCTest
    
#if DEBUG
@testable import HTTPStatusCodes
#else
import HTTPStatusCodes
#endif

extension HTTPStatusCode: IntegerLiteralConvertible {
    public init(integerLiteral value: Int) {
        guard let _ = HTTPStatusCode(rawValue: value) else {
            fatalError("Invalid status code: \(value)")
        }
        self.init(rawValue: value)!
    }
}
    
// Create with copy and paste of the enum and use:
//    FIND: \s*\n?(?:\s*///\s*.+\n)+\s*case (.+) = ([0-9]+)
// REPLACE: XCTAssertEqual(HTTPStatusCode.\1, \2)\n
final class RegressionTests: XCTestCase {

    func testVersion2_0() {
        XCTAssertEqual(HTTPStatusCode.Continue, 100)
        XCTAssertEqual(HTTPStatusCode.SwitchingProtocols, 101)
        XCTAssertEqual(HTTPStatusCode.Processing, 102)
        XCTAssertEqual(HTTPStatusCode.OK, 200)
        XCTAssertEqual(HTTPStatusCode.Created, 201)
        XCTAssertEqual(HTTPStatusCode.Accepted, 202)
        XCTAssertEqual(HTTPStatusCode.NonAuthoritativeInformation, 203)
        XCTAssertEqual(HTTPStatusCode.NoContent, 204)
        XCTAssertEqual(HTTPStatusCode.ResetContent, 205)
        XCTAssertEqual(HTTPStatusCode.PartialContent, 206)
        XCTAssertEqual(HTTPStatusCode.MultiStatus, 207)
        XCTAssertEqual(HTTPStatusCode.AlreadyReported, 208)
        XCTAssertEqual(HTTPStatusCode.IMUsed, 226)
        XCTAssertEqual(HTTPStatusCode.MultipleChoices, 300)
        XCTAssertEqual(HTTPStatusCode.MovedPermanently, 301)
        XCTAssertEqual(HTTPStatusCode.Found, 302)
        XCTAssertEqual(HTTPStatusCode.SeeOther, 303)
        XCTAssertEqual(HTTPStatusCode.NotModified, 304)
        XCTAssertEqual(HTTPStatusCode.UseProxy, 305)
        XCTAssertEqual(HTTPStatusCode.TemporaryRedirect, 307)
        XCTAssertEqual(HTTPStatusCode.PermanentRedirect, 308)
        XCTAssertEqual(HTTPStatusCode.BadRequest, 400)
        XCTAssertEqual(HTTPStatusCode.Unauthorized, 401)
        XCTAssertEqual(HTTPStatusCode.PaymentRequired, 402)
        XCTAssertEqual(HTTPStatusCode.Forbidden, 403)
        XCTAssertEqual(HTTPStatusCode.NotFound, 404)
        XCTAssertEqual(HTTPStatusCode.MethodNotAllowed, 405)
        XCTAssertEqual(HTTPStatusCode.NotAcceptable, 406)
        XCTAssertEqual(HTTPStatusCode.ProxyAuthenticationRequired, 407)
        XCTAssertEqual(HTTPStatusCode.RequestTimeout, 408)
        XCTAssertEqual(HTTPStatusCode.Conflict, 409)
        XCTAssertEqual(HTTPStatusCode.Gone, 410)
        XCTAssertEqual(HTTPStatusCode.LengthRequired, 411)
        XCTAssertEqual(HTTPStatusCode.PreconditionFailed, 412)
        XCTAssertEqual(HTTPStatusCode.RequestEntityTooLarge, 413)
        XCTAssertEqual(HTTPStatusCode.RequestURITooLong, 414)
        XCTAssertEqual(HTTPStatusCode.UnsupportedMediaType, 415)
        XCTAssertEqual(HTTPStatusCode.RequestedRangeNotSatisfiable, 416)
        XCTAssertEqual(HTTPStatusCode.ExpectationFailed, 417)
        XCTAssertEqual(HTTPStatusCode.ImATeapot, 418)
//        XCTAssertEqual(HTTPStatusCode.AuthenticationTimeout, 419)
        XCTAssertEqual(HTTPStatusCode.UnprocessableEntity, 422)
        XCTAssertEqual(HTTPStatusCode.Locked, 423)
        XCTAssertEqual(HTTPStatusCode.FailedDependency, 424)
        XCTAssertEqual(HTTPStatusCode.UpgradeRequired, 426)
        XCTAssertEqual(HTTPStatusCode.PreconditionRequired, 428)
        XCTAssertEqual(HTTPStatusCode.TooManyRequests, 429)
        XCTAssertEqual(HTTPStatusCode.RequestHeaderFieldsTooLarge, 431)
        XCTAssertEqual(HTTPStatusCode.LoginTimeout, 440)
        XCTAssertEqual(HTTPStatusCode.NoResponse, 444)
        XCTAssertEqual(HTTPStatusCode.RetryWith, 449)
        XCTAssertEqual(HTTPStatusCode.UnavailableForLegalReasons, 451)
//        XCTAssertEqual(HTTPStatusCode.RequestHeaderTooLarge, 494)
        XCTAssertEqual(HTTPStatusCode.CertError, 495)
        XCTAssertEqual(HTTPStatusCode.NoCert, 496)
        XCTAssertEqual(HTTPStatusCode.HTTPToHTTPS, 497)
        XCTAssertEqual(HTTPStatusCode.TokenExpired, 498)
        XCTAssertEqual(HTTPStatusCode.ClientClosedRequest, 499)
        XCTAssertEqual(HTTPStatusCode.InternalServerError, 500)
        XCTAssertEqual(HTTPStatusCode.NotImplemented, 501)
        XCTAssertEqual(HTTPStatusCode.BadGateway, 502)
        XCTAssertEqual(HTTPStatusCode.ServiceUnavailable, 503)
        XCTAssertEqual(HTTPStatusCode.GatewayTimeout, 504)
        XCTAssertEqual(HTTPStatusCode.HTTPVersionNotSupported, 505)
        XCTAssertEqual(HTTPStatusCode.VariantAlsoNegotiates, 506)
        XCTAssertEqual(HTTPStatusCode.InsufficientStorage, 507)
        XCTAssertEqual(HTTPStatusCode.LoopDetected, 508)
        XCTAssertEqual(HTTPStatusCode.BandwidthLimitExceeded, 509)
        XCTAssertEqual(HTTPStatusCode.NotExtended, 510)
        XCTAssertEqual(HTTPStatusCode.NetworkAuthenticationRequired, 511)
//        XCTAssertEqual(HTTPStatusCode.NetworkTimeoutError, 599)
    }
    
    func testVersion3_0() {
        XCTAssertEqual(HTTPStatusCode.Continue, 100)
        XCTAssertEqual(HTTPStatusCode.SwitchingProtocols, 101)
        XCTAssertEqual(HTTPStatusCode.Processing, 102)
        XCTAssertEqual(HTTPStatusCode.Checkpoint, 103)
        XCTAssertEqual(HTTPStatusCode.OK, 200)
        XCTAssertEqual(HTTPStatusCode.Created, 201)
        XCTAssertEqual(HTTPStatusCode.Accepted, 202)
        XCTAssertEqual(HTTPStatusCode.NonAuthoritativeInformation, 203)
        XCTAssertEqual(HTTPStatusCode.NoContent, 204)
        XCTAssertEqual(HTTPStatusCode.ResetContent, 205)
        XCTAssertEqual(HTTPStatusCode.PartialContent, 206)
        XCTAssertEqual(HTTPStatusCode.MultiStatus, 207)
        XCTAssertEqual(HTTPStatusCode.AlreadyReported, 208)
        XCTAssertEqual(HTTPStatusCode.IMUsed, 226)
        XCTAssertEqual(HTTPStatusCode.MultipleChoices, 300)
        XCTAssertEqual(HTTPStatusCode.MovedPermanently, 301)
        XCTAssertEqual(HTTPStatusCode.Found, 302)
        XCTAssertEqual(HTTPStatusCode.SeeOther, 303)
        XCTAssertEqual(HTTPStatusCode.NotModified, 304)
        XCTAssertEqual(HTTPStatusCode.UseProxy, 305)
        XCTAssertEqual(HTTPStatusCode.TemporaryRedirect, 307)
        XCTAssertEqual(HTTPStatusCode.PermanentRedirect, 308)
        XCTAssertEqual(HTTPStatusCode.BadRequest, 400)
        XCTAssertEqual(HTTPStatusCode.Unauthorized, 401)
        XCTAssertEqual(HTTPStatusCode.PaymentRequired, 402)
        XCTAssertEqual(HTTPStatusCode.Forbidden, 403)
        XCTAssertEqual(HTTPStatusCode.NotFound, 404)
        XCTAssertEqual(HTTPStatusCode.MethodNotAllowed, 405)
        XCTAssertEqual(HTTPStatusCode.NotAcceptable, 406)
        XCTAssertEqual(HTTPStatusCode.ProxyAuthenticationRequired, 407)
        XCTAssertEqual(HTTPStatusCode.RequestTimeout, 408)
        XCTAssertEqual(HTTPStatusCode.Conflict, 409)
        XCTAssertEqual(HTTPStatusCode.Gone, 410)
        XCTAssertEqual(HTTPStatusCode.LengthRequired, 411)
        XCTAssertEqual(HTTPStatusCode.PreconditionFailed, 412)
        XCTAssertEqual(HTTPStatusCode.PayloadTooLarge, 413)
        XCTAssertEqual(HTTPStatusCode.URITooLong, 414)
        XCTAssertEqual(HTTPStatusCode.UnsupportedMediaType, 415)
        XCTAssertEqual(HTTPStatusCode.RangeNotSatisfiable, 416)
        XCTAssertEqual(HTTPStatusCode.ExpectationFailed, 417)
        XCTAssertEqual(HTTPStatusCode.ImATeapot, 418)
        XCTAssertEqual(HTTPStatusCode.MisdirectedRequest, 421)
        XCTAssertEqual(HTTPStatusCode.UnprocessableEntity, 422)
        XCTAssertEqual(HTTPStatusCode.Locked, 423)
        XCTAssertEqual(HTTPStatusCode.FailedDependency, 424)
        XCTAssertEqual(HTTPStatusCode.UpgradeRequired, 426)
        XCTAssertEqual(HTTPStatusCode.PreconditionRequired, 428)
        XCTAssertEqual(HTTPStatusCode.TooManyRequests, 429)
        XCTAssertEqual(HTTPStatusCode.RequestHeaderFieldsTooLarge, 431)
        XCTAssertEqual(HTTPStatusCode.IISLoginTimeout, 440)
        XCTAssertEqual(HTTPStatusCode.NginxNoResponse, 444)
        XCTAssertEqual(HTTPStatusCode.IISRetryWith, 449)
        XCTAssertEqual(HTTPStatusCode.BlockedByWindowsParentalControls, 450)
        XCTAssertEqual(HTTPStatusCode.UnavailableForLegalReasons, 451)
        XCTAssertEqual(HTTPStatusCode.NginxSSLCertificateError, 495)
        XCTAssertEqual(HTTPStatusCode.NginxSSLCertificateRequired, 496)
        XCTAssertEqual(HTTPStatusCode.NginxHTTPToHTTPS, 497)
        XCTAssertEqual(HTTPStatusCode.TokenExpired, 498)
        XCTAssertEqual(HTTPStatusCode.NginxClientClosedRequest, 499)
        XCTAssertEqual(HTTPStatusCode.InternalServerError, 500)
        XCTAssertEqual(HTTPStatusCode.NotImplemented, 501)
        XCTAssertEqual(HTTPStatusCode.BadGateway, 502)
        XCTAssertEqual(HTTPStatusCode.ServiceUnavailable, 503)
        XCTAssertEqual(HTTPStatusCode.GatewayTimeout, 504)
        XCTAssertEqual(HTTPStatusCode.HTTPVersionNotSupported, 505)
        XCTAssertEqual(HTTPStatusCode.VariantAlsoNegotiates, 506)
        XCTAssertEqual(HTTPStatusCode.InsufficientStorage, 507)
        XCTAssertEqual(HTTPStatusCode.LoopDetected, 508)
        XCTAssertEqual(HTTPStatusCode.BandwidthLimitExceeded, 509)
        XCTAssertEqual(HTTPStatusCode.NotExtended, 510)
        XCTAssertEqual(HTTPStatusCode.NetworkAuthenticationRequired, 511)
        XCTAssertEqual(HTTPStatusCode.SiteIsFrozen, 530)
    }
}
    
#endif
