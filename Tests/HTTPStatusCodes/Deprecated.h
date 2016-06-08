//
//  Deprecated.h
//  HTTPStatusCodes
//
//  Created by Richard Hodgkins on 08/06/2016.
//  Copyright © 2016 Rich H. All rights reserved.
//

@import Foundation;

// MARK: - Deprecated

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.RequestEntityTooLarge instead") HTTPStatusCodeRequestEntityTooLarge __deprecated_enum_msg("Renamed to HTTPStatusCodePayloadTooLarge");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.RequestURITooLong instead") HTTPStatusCodeRequestURITooLong __deprecated_enum_msg("Renamed to HTTPStatusCodeURITooLong");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.RequestedRangeNotSatisfiable instead") HTTPStatusCodeRequestedRangeNotSatisfiable __deprecated_enum_msg("Renamed to HTTPStatusCodeRangeNotSatisfiable");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.LoginTimeout instead") HTTPStatusCodeLoginTimeout __deprecated_enum_msg("Renamed to HTTPStatusCodeIISLoginTimeout");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.RetryWith instead") HTTPStatusCodeRetryWith __deprecated_enum_msg("Renamed to HTTPStatusCodeIISRetryWith");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.NoResponse instead") HTTPStatusCodeNoResponse __deprecated_enum_msg("Renamed to HTTPStatusCodeNginxNoResponse");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.CertError instead") HTTPStatusCodeCertError __deprecated_enum_msg("Renamed to HTTPStatusCodeNginxSSLCertificateError");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.NoCert instead") HTTPStatusCodeNoCert __deprecated_enum_msg("Renamed to HTTPStatusCodeNginxSSLCertificateRequired");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.HTTPToHTTPS instead") HTTPStatusCodeHTTPToHTTPS __deprecated_enum_msg("Renamed to HTTPStatusCodeNginxHTTPToHTTPS");

FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.ClientClosedRequest instead") HTTPStatusCodeClientClosedRequest __deprecated_enum_msg("Renamed to HTTPStatusCodeNginxClientClosedRequest");

/// Returned by version 1 of the Twitter Search and Trends API when the client is being rate limited; versions 1.1 and later use the 429 Too Many Requests response code instead.
///
/// - seealso: [Twitter Error Codes & Responses](https://dev.twitter.com/docs/error-codes-responses)
FOUNDATION_EXTERN const NSInteger NS_SWIFT_UNAVAILABLE("Use HTTPStatusCode.TwitterEnhanceYourCalm instead") HTTPStatusCodeTwitterEnhanceYourCalm __deprecated_enum_msg("Renamed to HTTPStatusCodeTooManyRequests");


// MARK: - Removed

/// Switch Proxy: 306
///
/// No longer used. Originally meant "Subsequent requests should use the specified proxy."
///
/// - seealso: [Original draft](https://tools.ietf.org/html/draft-cohen-http-305-306-responses-00)
FOUNDATION_EXTERN const NSInteger HTTPStatusCodeSwitchProxy NS_UNAVAILABLE;

/// Authentication Timeout: 419
///
/// Removed from Wikipedia page.
FOUNDATION_EXTERN const NSInteger HTTPStatusCodeAuthenticationTimeout NS_UNAVAILABLE;

/// Method Failure: 419
///
/// A deprecated response used by the Spring Framework when a method has failed.
///
/// - seealso: [Spring Framework: HttpStatus enum documentation - `METHOD_FAILURE`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/HttpStatus.html#METHOD_FAILURE)
FOUNDATION_EXTERN const NSInteger HTTPStatusCodeSpringFrameworkMethodFailure NS_UNAVAILABLE;

/// Request Header Too Large: 494
///
/// Removed and replaced with `RequestHeaderFieldsTooLarge` - 431
FOUNDATION_EXTERN const NSInteger HTTPStatusCodeRequestHeaderTooLarge NS_UNAVAILABLE;

/// Network Timeout Error: 599
///
/// Removed from Wikipedia page.
FOUNDATION_EXTERN const NSInteger HTTPStatusCodeNetworkTimeoutError NS_UNAVAILABLE;
