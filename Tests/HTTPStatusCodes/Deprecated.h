//
//  Deprecated.h
//  HTTPStatusCodes
//
//  Created by Richard Hodgkins on 08/06/2016.
//  Copyright © 2016 Rich H. All rights reserved.
//

@import Foundation;

/// Used to clean up API, should not be used externally.
typedef const NSInteger __HTTPStatusCode NS_SWIFT_UNAVAILABLE("");

// MARK: - Deprecated

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeRequestEntityTooLarge NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.requestEntityTooLarge instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodePayloadTooLarge");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeRequestURITooLong NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.requestURITooLong instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeURITooLong");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeRequestedRangeNotSatisfiable NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.requestedRangeNotSatisfiable instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeRangeNotSatisfiable");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeLoginTimeout NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.loginTimeout instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeIISLoginTimeout");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeRetryWith NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.retryWith instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeIISRetryWith");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeNoResponse NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.noResponse instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeNginxNoResponse");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeCertError NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.certError instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeNginxSSLCertificateError");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeNoCert NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.noCert instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeNginxSSLCertificateRequired");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeHTTPToHTTPS NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.hTTPToHTTPS instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeNginxHTTPToHTTPS");

FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeClientClosedRequest NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.clientClosedRequest instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeNginxClientClosedRequest");

/// Returned by version 1 of the Twitter Search and Trends API when the client is being rate limited; versions 1.1 and later use the 429 Too Many Requests response code instead.
///
/// - seealso: [Twitter Error Codes & Responses](https://dev.twitter.com/docs/error-codes-responses)
FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeTwitterEnhanceYourCalm NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.TwitterEnhanceYourCalm instead") DEPRECATED_MSG_ATTRIBUTE("Renamed to HTTPStatusCodeTooManyRequests");


// MARK: - Removed

/// Switch Proxy: 306
///
/// No longer used. Originally meant "Subsequent requests should use the specified proxy."
///
/// - seealso: [Original draft](https://tools.ietf.org/html/draft-cohen-http-305-306-responses-00)
FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeSwitchProxy NS_UNAVAILABLE;

/// Authentication Timeout: 419
///
/// Removed from Wikipedia page.
FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeAuthenticationTimeout NS_UNAVAILABLE;

/// Method Failure: 419
///
/// A deprecated response used by the Spring Framework when a method has failed.
///
/// - seealso: [Spring Framework: HttpStatus enum documentation - `METHOD_FAILURE`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/HttpStatus.html#METHOD_FAILURE)
FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeSpringFrameworkMethodFailure NS_UNAVAILABLE;

/// Request Header Too Large: 494
///
/// Removed and replaced with `RequestHeaderFieldsTooLarge` - 431
FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeRequestHeaderTooLarge NS_UNAVAILABLE;

/// Network Timeout Error: 599
///
/// Removed from Wikipedia page.
FOUNDATION_EXTERN __HTTPStatusCode HTTPStatusCodeNetworkTimeoutError NS_UNAVAILABLE;
