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

extension HTTPStatusCode: ExpressibleByIntegerLiteral {
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
        XCTAssertEqual(HTTPStatusCode.continue, 100)
        XCTAssertEqual(HTTPStatusCode.switchingProtocols, 101)
        XCTAssertEqual(HTTPStatusCode.processing, 102)
        XCTAssertEqual(HTTPStatusCode.ok, 200)
        XCTAssertEqual(HTTPStatusCode.created, 201)
        XCTAssertEqual(HTTPStatusCode.accepted, 202)
        XCTAssertEqual(HTTPStatusCode.nonAuthoritativeInformation, 203)
        XCTAssertEqual(HTTPStatusCode.noContent, 204)
        XCTAssertEqual(HTTPStatusCode.resetContent, 205)
        XCTAssertEqual(HTTPStatusCode.partialContent, 206)
        XCTAssertEqual(HTTPStatusCode.multiStatus, 207)
        XCTAssertEqual(HTTPStatusCode.alreadyReported, 208)
        XCTAssertEqual(HTTPStatusCode.imUsed, 226)
        XCTAssertEqual(HTTPStatusCode.multipleChoices, 300)
        XCTAssertEqual(HTTPStatusCode.movedPermanently, 301)
        XCTAssertEqual(HTTPStatusCode.found, 302)
        XCTAssertEqual(HTTPStatusCode.seeOther, 303)
        XCTAssertEqual(HTTPStatusCode.notModified, 304)
        XCTAssertEqual(HTTPStatusCode.useProxy, 305)
        XCTAssertEqual(HTTPStatusCode.temporaryRedirect, 307)
        XCTAssertEqual(HTTPStatusCode.permanentRedirect, 308)
        XCTAssertEqual(HTTPStatusCode.badRequest, 400)
        XCTAssertEqual(HTTPStatusCode.unauthorized, 401)
        XCTAssertEqual(HTTPStatusCode.paymentRequired, 402)
        XCTAssertEqual(HTTPStatusCode.forbidden, 403)
        XCTAssertEqual(HTTPStatusCode.notFound, 404)
        XCTAssertEqual(HTTPStatusCode.methodNotAllowed, 405)
        XCTAssertEqual(HTTPStatusCode.notAcceptable, 406)
        XCTAssertEqual(HTTPStatusCode.proxyAuthenticationRequired, 407)
        XCTAssertEqual(HTTPStatusCode.requestTimeout, 408)
        XCTAssertEqual(HTTPStatusCode.conflict, 409)
        XCTAssertEqual(HTTPStatusCode.gone, 410)
        XCTAssertEqual(HTTPStatusCode.lengthRequired, 411)
        XCTAssertEqual(HTTPStatusCode.preconditionFailed, 412)
        XCTAssertEqual(HTTPStatusCode.payloadTooLarge, 413)
        XCTAssertEqual(HTTPStatusCode.uriTooLong, 414)
        XCTAssertEqual(HTTPStatusCode.unsupportedMediaType, 415)
        XCTAssertEqual(HTTPStatusCode.rangeNotSatisfiable, 416)
        XCTAssertEqual(HTTPStatusCode.expectationFailed, 417)
        XCTAssertEqual(HTTPStatusCode.imATeapot, 418)
//        XCTAssertEqual(HTTPStatusCode.AuthenticationTimeout, 419)
        XCTAssertEqual(HTTPStatusCode.unprocessableEntity, 422)
        XCTAssertEqual(HTTPStatusCode.locked, 423)
        XCTAssertEqual(HTTPStatusCode.failedDependency, 424)
        XCTAssertEqual(HTTPStatusCode.upgradeRequired, 426)
        XCTAssertEqual(HTTPStatusCode.preconditionRequired, 428)
        XCTAssertEqual(HTTPStatusCode.tooManyRequests, 429)
        XCTAssertEqual(HTTPStatusCode.requestHeaderFieldsTooLarge, 431)
        XCTAssertEqual(HTTPStatusCode.iisLoginTimeout, 440)
        XCTAssertEqual(HTTPStatusCode.nginxNoResponse, 444)
        XCTAssertEqual(HTTPStatusCode.iisRetryWith, 449)
        XCTAssertEqual(HTTPStatusCode.unavailableForLegalReasons, 451)
//        XCTAssertEqual(HTTPStatusCode.RequestHeaderTooLarge, 494)
        XCTAssertEqual(HTTPStatusCode.nginxSSLCertificateError, 495)
        XCTAssertEqual(HTTPStatusCode.nginxSSLCertificateRequired, 496)
        XCTAssertEqual(HTTPStatusCode.nginxHTTPToHTTPS, 497)
        XCTAssertEqual(HTTPStatusCode.tokenExpired, 498)
        XCTAssertEqual(HTTPStatusCode.nginxClientClosedRequest, 499)
        XCTAssertEqual(HTTPStatusCode.internalServerError, 500)
        XCTAssertEqual(HTTPStatusCode.notImplemented, 501)
        XCTAssertEqual(HTTPStatusCode.badGateway, 502)
        XCTAssertEqual(HTTPStatusCode.serviceUnavailable, 503)
        XCTAssertEqual(HTTPStatusCode.gatewayTimeout, 504)
        XCTAssertEqual(HTTPStatusCode.httpVersionNotSupported, 505)
        XCTAssertEqual(HTTPStatusCode.variantAlsoNegotiates, 506)
        XCTAssertEqual(HTTPStatusCode.insufficientStorage, 507)
        XCTAssertEqual(HTTPStatusCode.loopDetected, 508)
        XCTAssertEqual(HTTPStatusCode.bandwidthLimitExceeded, 509)
        XCTAssertEqual(HTTPStatusCode.notExtended, 510)
        XCTAssertEqual(HTTPStatusCode.networkAuthenticationRequired, 511)
//        XCTAssertEqual(HTTPStatusCode.NetworkTimeoutError, 599)
    }
    
    func testVersion3_0() {
        XCTAssertEqual(HTTPStatusCode.continue, 100)
        XCTAssertEqual(HTTPStatusCode.switchingProtocols, 101)
        XCTAssertEqual(HTTPStatusCode.processing, 102)
        XCTAssertEqual(HTTPStatusCode.checkpoint, 103)
        XCTAssertEqual(HTTPStatusCode.ok, 200)
        XCTAssertEqual(HTTPStatusCode.created, 201)
        XCTAssertEqual(HTTPStatusCode.accepted, 202)
        XCTAssertEqual(HTTPStatusCode.nonAuthoritativeInformation, 203)
        XCTAssertEqual(HTTPStatusCode.noContent, 204)
        XCTAssertEqual(HTTPStatusCode.resetContent, 205)
        XCTAssertEqual(HTTPStatusCode.partialContent, 206)
        XCTAssertEqual(HTTPStatusCode.multiStatus, 207)
        XCTAssertEqual(HTTPStatusCode.alreadyReported, 208)
        XCTAssertEqual(HTTPStatusCode.imUsed, 226)
        XCTAssertEqual(HTTPStatusCode.multipleChoices, 300)
        XCTAssertEqual(HTTPStatusCode.movedPermanently, 301)
        XCTAssertEqual(HTTPStatusCode.found, 302)
        XCTAssertEqual(HTTPStatusCode.seeOther, 303)
        XCTAssertEqual(HTTPStatusCode.notModified, 304)
        XCTAssertEqual(HTTPStatusCode.useProxy, 305)
        XCTAssertEqual(HTTPStatusCode.temporaryRedirect, 307)
        XCTAssertEqual(HTTPStatusCode.permanentRedirect, 308)
        XCTAssertEqual(HTTPStatusCode.badRequest, 400)
        XCTAssertEqual(HTTPStatusCode.unauthorized, 401)
        XCTAssertEqual(HTTPStatusCode.paymentRequired, 402)
        XCTAssertEqual(HTTPStatusCode.forbidden, 403)
        XCTAssertEqual(HTTPStatusCode.notFound, 404)
        XCTAssertEqual(HTTPStatusCode.methodNotAllowed, 405)
        XCTAssertEqual(HTTPStatusCode.notAcceptable, 406)
        XCTAssertEqual(HTTPStatusCode.proxyAuthenticationRequired, 407)
        XCTAssertEqual(HTTPStatusCode.requestTimeout, 408)
        XCTAssertEqual(HTTPStatusCode.conflict, 409)
        XCTAssertEqual(HTTPStatusCode.gone, 410)
        XCTAssertEqual(HTTPStatusCode.lengthRequired, 411)
        XCTAssertEqual(HTTPStatusCode.preconditionFailed, 412)
        XCTAssertEqual(HTTPStatusCode.payloadTooLarge, 413)
        XCTAssertEqual(HTTPStatusCode.uriTooLong, 414)
        XCTAssertEqual(HTTPStatusCode.unsupportedMediaType, 415)
        XCTAssertEqual(HTTPStatusCode.rangeNotSatisfiable, 416)
        XCTAssertEqual(HTTPStatusCode.expectationFailed, 417)
        XCTAssertEqual(HTTPStatusCode.imATeapot, 418)
        XCTAssertEqual(HTTPStatusCode.misdirectedRequest, 421)
        XCTAssertEqual(HTTPStatusCode.unprocessableEntity, 422)
        XCTAssertEqual(HTTPStatusCode.locked, 423)
        XCTAssertEqual(HTTPStatusCode.failedDependency, 424)
        XCTAssertEqual(HTTPStatusCode.upgradeRequired, 426)
        XCTAssertEqual(HTTPStatusCode.preconditionRequired, 428)
        XCTAssertEqual(HTTPStatusCode.tooManyRequests, 429)
        XCTAssertEqual(HTTPStatusCode.requestHeaderFieldsTooLarge, 431)
        XCTAssertEqual(HTTPStatusCode.iisLoginTimeout, 440)
        XCTAssertEqual(HTTPStatusCode.nginxNoResponse, 444)
        XCTAssertEqual(HTTPStatusCode.iisRetryWith, 449)
        XCTAssertEqual(HTTPStatusCode.blockedByWindowsParentalControls, 450)
        XCTAssertEqual(HTTPStatusCode.unavailableForLegalReasons, 451)
        XCTAssertEqual(HTTPStatusCode.nginxSSLCertificateError, 495)
        XCTAssertEqual(HTTPStatusCode.nginxSSLCertificateRequired, 496)
        XCTAssertEqual(HTTPStatusCode.nginxHTTPToHTTPS, 497)
        XCTAssertEqual(HTTPStatusCode.tokenExpired, 498)
        XCTAssertEqual(HTTPStatusCode.nginxClientClosedRequest, 499)
        XCTAssertEqual(HTTPStatusCode.internalServerError, 500)
        XCTAssertEqual(HTTPStatusCode.notImplemented, 501)
        XCTAssertEqual(HTTPStatusCode.badGateway, 502)
        XCTAssertEqual(HTTPStatusCode.serviceUnavailable, 503)
        XCTAssertEqual(HTTPStatusCode.gatewayTimeout, 504)
        XCTAssertEqual(HTTPStatusCode.httpVersionNotSupported, 505)
        XCTAssertEqual(HTTPStatusCode.variantAlsoNegotiates, 506)
        XCTAssertEqual(HTTPStatusCode.insufficientStorage, 507)
        XCTAssertEqual(HTTPStatusCode.loopDetected, 508)
        XCTAssertEqual(HTTPStatusCode.bandwidthLimitExceeded, 509)
        XCTAssertEqual(HTTPStatusCode.notExtended, 510)
        XCTAssertEqual(HTTPStatusCode.networkAuthenticationRequired, 511)
        XCTAssertEqual(HTTPStatusCode.siteIsFrozen, 530)
    }
}
    
#endif
