//
//  ObjectiveCRegressionTests.m
//  ObjectiveCTests
//
//  Created by Richard Hodgkins on 09/06/2016.
//  Copyright © 2016 Rich H. All rights reserved.
//

#import <XCTest/XCTest.h>

@import HTTPStatusCodes;

//#import <HTTPStatusCodes/HTTPStatusCodes-Swift.h>

@interface ObjectiveCRegressionTests : XCTestCase

@end

// Create with copy and paste of the enum and use:
//    FIND: \s*\n?(?:\s*///\s*.+\n)+\s*case (.+) = ([0-9]+)
// REPLACE: XCTAssertEqual(HTTPStatusCode\1, \2);\n
@implementation ObjectiveCRegressionTests

-(void)testVersion2_0
{
    XCTAssertEqual(HTTPStatusCodeContinue, 100);
    XCTAssertEqual(HTTPStatusCodeSwitchingProtocols, 101);
    XCTAssertEqual(HTTPStatusCodeProcessing, 102);
    XCTAssertEqual(HTTPStatusCodeOK, 200);
    XCTAssertEqual(HTTPStatusCodeCreated, 201);
    XCTAssertEqual(HTTPStatusCodeAccepted, 202);
    XCTAssertEqual(HTTPStatusCodeNonAuthoritativeInformation, 203);
    XCTAssertEqual(HTTPStatusCodeNoContent, 204);
    XCTAssertEqual(HTTPStatusCodeResetContent, 205);
    XCTAssertEqual(HTTPStatusCodePartialContent, 206);
    XCTAssertEqual(HTTPStatusCodeMultiStatus, 207);
    XCTAssertEqual(HTTPStatusCodeAlreadyReported, 208);
    XCTAssertEqual(HTTPStatusCodeIMUsed, 226);
    XCTAssertEqual(HTTPStatusCodeMultipleChoices, 300);
    XCTAssertEqual(HTTPStatusCodeMovedPermanently, 301);
    XCTAssertEqual(HTTPStatusCodeFound, 302);
    XCTAssertEqual(HTTPStatusCodeSeeOther, 303);
    XCTAssertEqual(HTTPStatusCodeNotModified, 304);
    XCTAssertEqual(HTTPStatusCodeUseProxy, 305);
    XCTAssertEqual(HTTPStatusCodeTemporaryRedirect, 307);
    XCTAssertEqual(HTTPStatusCodePermanentRedirect, 308);
    XCTAssertEqual(HTTPStatusCodeBadRequest, 400);
    XCTAssertEqual(HTTPStatusCodeUnauthorized, 401);
    XCTAssertEqual(HTTPStatusCodePaymentRequired, 402);
    XCTAssertEqual(HTTPStatusCodeForbidden, 403);
    XCTAssertEqual(HTTPStatusCodeNotFound, 404);
    XCTAssertEqual(HTTPStatusCodeMethodNotAllowed, 405);
    XCTAssertEqual(HTTPStatusCodeNotAcceptable, 406);
    XCTAssertEqual(HTTPStatusCodeProxyAuthenticationRequired, 407);
    XCTAssertEqual(HTTPStatusCodeRequestTimeout, 408);
    XCTAssertEqual(HTTPStatusCodeConflict, 409);
    XCTAssertEqual(HTTPStatusCodeGone, 410);
    XCTAssertEqual(HTTPStatusCodeLengthRequired, 411);
    XCTAssertEqual(HTTPStatusCodePreconditionFailed, 412);
    XCTAssertEqual(HTTPStatusCodeRequestEntityTooLarge, 413);
    XCTAssertEqual(HTTPStatusCodeRequestURITooLong, 414);
    XCTAssertEqual(HTTPStatusCodeUnsupportedMediaType, 415);
    XCTAssertEqual(HTTPStatusCodeRequestedRangeNotSatisfiable, 416);
    XCTAssertEqual(HTTPStatusCodeExpectationFailed, 417);
    XCTAssertEqual(HTTPStatusCodeImATeapot, 418);
//    XCTAssertEqual(HTTPStatusCodeAuthenticationTimeout, 419);
    XCTAssertEqual(HTTPStatusCodeUnprocessableEntity, 422);
    XCTAssertEqual(HTTPStatusCodeLocked, 423);
    XCTAssertEqual(HTTPStatusCodeFailedDependency, 424);
    XCTAssertEqual(HTTPStatusCodeUpgradeRequired, 426);
    XCTAssertEqual(HTTPStatusCodePreconditionRequired, 428);
    XCTAssertEqual(HTTPStatusCodeTooManyRequests, 429);
    XCTAssertEqual(HTTPStatusCodeRequestHeaderFieldsTooLarge, 431);
    XCTAssertEqual(HTTPStatusCodeLoginTimeout, 440);
    XCTAssertEqual(HTTPStatusCodeNoResponse, 444);
    XCTAssertEqual(HTTPStatusCodeRetryWith, 449);
    XCTAssertEqual(HTTPStatusCodeUnavailableForLegalReasons, 451);
//    XCTAssertEqual(HTTPStatusCodeRequestHeaderTooLarge, 494);
    XCTAssertEqual(HTTPStatusCodeCertError, 495);
    XCTAssertEqual(HTTPStatusCodeNoCert, 496);
    XCTAssertEqual(HTTPStatusCodeHTTPToHTTPS, 497);
    XCTAssertEqual(HTTPStatusCodeTokenExpired, 498);
    XCTAssertEqual(HTTPStatusCodeClientClosedRequest, 499);
    XCTAssertEqual(HTTPStatusCodeInternalServerError, 500);
    XCTAssertEqual(HTTPStatusCodeNotImplemented, 501);
    XCTAssertEqual(HTTPStatusCodeBadGateway, 502);
    XCTAssertEqual(HTTPStatusCodeServiceUnavailable, 503);
    XCTAssertEqual(HTTPStatusCodeGatewayTimeout, 504);
    XCTAssertEqual(HTTPStatusCodeHTTPVersionNotSupported, 505);
    XCTAssertEqual(HTTPStatusCodeVariantAlsoNegotiates, 506);
    XCTAssertEqual(HTTPStatusCodeInsufficientStorage, 507);
    XCTAssertEqual(HTTPStatusCodeLoopDetected, 508);
    XCTAssertEqual(HTTPStatusCodeBandwidthLimitExceeded, 509);
    XCTAssertEqual(HTTPStatusCodeNotExtended, 510);
    XCTAssertEqual(HTTPStatusCodeNetworkAuthenticationRequired, 511);
//    XCTAssertEqual(HTTPStatusCodeNetworkTimeoutError, 599);
}

-(void)testVersion3_0
{
    XCTAssertEqual(HTTPStatusCodeContinue, 100);
    XCTAssertEqual(HTTPStatusCodeSwitchingProtocols, 101);
    XCTAssertEqual(HTTPStatusCodeProcessing, 102);
    XCTAssertEqual(HTTPStatusCodeCheckpoint, 103);
    XCTAssertEqual(HTTPStatusCodeOK, 200);
    XCTAssertEqual(HTTPStatusCodeCreated, 201);
    XCTAssertEqual(HTTPStatusCodeAccepted, 202);
    XCTAssertEqual(HTTPStatusCodeNonAuthoritativeInformation, 203);
    XCTAssertEqual(HTTPStatusCodeNoContent, 204);
    XCTAssertEqual(HTTPStatusCodeResetContent, 205);
    XCTAssertEqual(HTTPStatusCodePartialContent, 206);
    XCTAssertEqual(HTTPStatusCodeMultiStatus, 207);
    XCTAssertEqual(HTTPStatusCodeAlreadyReported, 208);
    XCTAssertEqual(HTTPStatusCodeIMUsed, 226);
    XCTAssertEqual(HTTPStatusCodeMultipleChoices, 300);
    XCTAssertEqual(HTTPStatusCodeMovedPermanently, 301);
    XCTAssertEqual(HTTPStatusCodeFound, 302);
    XCTAssertEqual(HTTPStatusCodeSeeOther, 303);
    XCTAssertEqual(HTTPStatusCodeNotModified, 304);
    XCTAssertEqual(HTTPStatusCodeUseProxy, 305);
    XCTAssertEqual(HTTPStatusCodeTemporaryRedirect, 307);
    XCTAssertEqual(HTTPStatusCodePermanentRedirect, 308);
    XCTAssertEqual(HTTPStatusCodeBadRequest, 400);
    XCTAssertEqual(HTTPStatusCodeUnauthorized, 401);
    XCTAssertEqual(HTTPStatusCodePaymentRequired, 402);
    XCTAssertEqual(HTTPStatusCodeForbidden, 403);
    XCTAssertEqual(HTTPStatusCodeNotFound, 404);
    XCTAssertEqual(HTTPStatusCodeMethodNotAllowed, 405);
    XCTAssertEqual(HTTPStatusCodeNotAcceptable, 406);
    XCTAssertEqual(HTTPStatusCodeProxyAuthenticationRequired, 407);
    XCTAssertEqual(HTTPStatusCodeRequestTimeout, 408);
    XCTAssertEqual(HTTPStatusCodeConflict, 409);
    XCTAssertEqual(HTTPStatusCodeGone, 410);
    XCTAssertEqual(HTTPStatusCodeLengthRequired, 411);
    XCTAssertEqual(HTTPStatusCodePreconditionFailed, 412);
    XCTAssertEqual(HTTPStatusCodePayloadTooLarge, 413);
    XCTAssertEqual(HTTPStatusCodeURITooLong, 414);
    XCTAssertEqual(HTTPStatusCodeUnsupportedMediaType, 415);
    XCTAssertEqual(HTTPStatusCodeRangeNotSatisfiable, 416);
    XCTAssertEqual(HTTPStatusCodeExpectationFailed, 417);
    XCTAssertEqual(HTTPStatusCodeImATeapot, 418);
    XCTAssertEqual(HTTPStatusCodeMisdirectedRequest, 421);
    XCTAssertEqual(HTTPStatusCodeUnprocessableEntity, 422);
    XCTAssertEqual(HTTPStatusCodeLocked, 423);
    XCTAssertEqual(HTTPStatusCodeFailedDependency, 424);
    XCTAssertEqual(HTTPStatusCodeUpgradeRequired, 426);
    XCTAssertEqual(HTTPStatusCodePreconditionRequired, 428);
    XCTAssertEqual(HTTPStatusCodeTooManyRequests, 429);
    XCTAssertEqual(HTTPStatusCodeRequestHeaderFieldsTooLarge, 431);
    XCTAssertEqual(HTTPStatusCodeIISLoginTimeout, 440);
    XCTAssertEqual(HTTPStatusCodeNginxNoResponse, 444);
    XCTAssertEqual(HTTPStatusCodeIISRetryWith, 449);
    XCTAssertEqual(HTTPStatusCodeBlockedByWindowsParentalControls, 450);
    XCTAssertEqual(HTTPStatusCodeUnavailableForLegalReasons, 451);
    XCTAssertEqual(HTTPStatusCodeNginxSSLCertificateError, 495);
    XCTAssertEqual(HTTPStatusCodeNginxSSLCertificateRequired, 496);
    XCTAssertEqual(HTTPStatusCodeNginxHTTPToHTTPS, 497);
    XCTAssertEqual(HTTPStatusCodeTokenExpired, 498);
    XCTAssertEqual(HTTPStatusCodeNginxClientClosedRequest, 499);
    XCTAssertEqual(HTTPStatusCodeInternalServerError, 500);
    XCTAssertEqual(HTTPStatusCodeNotImplemented, 501);
    XCTAssertEqual(HTTPStatusCodeBadGateway, 502);
    XCTAssertEqual(HTTPStatusCodeServiceUnavailable, 503);
    XCTAssertEqual(HTTPStatusCodeGatewayTimeout, 504);
    XCTAssertEqual(HTTPStatusCodeHTTPVersionNotSupported, 505);
    XCTAssertEqual(HTTPStatusCodeVariantAlsoNegotiates, 506);
    XCTAssertEqual(HTTPStatusCodeInsufficientStorage, 507);
    XCTAssertEqual(HTTPStatusCodeLoopDetected, 508);
    XCTAssertEqual(HTTPStatusCodeBandwidthLimitExceeded, 509);
    XCTAssertEqual(HTTPStatusCodeNotExtended, 510);
    XCTAssertEqual(HTTPStatusCodeNetworkAuthenticationRequired, 511);
    XCTAssertEqual(HTTPStatusCodeSiteIsFrozen, 530);
}

@end
