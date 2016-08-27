//
//  Deprecated.c
//  HTTPStatusCodes
//
//  Created by Richard Hodgkins on 08/06/2016.
//  Copyright © 2016 Rich H. All rights reserved.
//

#import "Deprecated.h"

#import <HTTPStatusCodes/HTTPStatusCodes-Swift.h>

// MARK: - Deprecated

__HTTPStatusCode HTTPStatusCodeRequestEntityTooLarge = HTTPStatusCodePayloadTooLarge;
__HTTPStatusCode HTTPStatusCodeRequestURITooLong = HTTPStatusCodeUriTooLong;
__HTTPStatusCode HTTPStatusCodeRequestedRangeNotSatisfiable = HTTPStatusCodeRangeNotSatisfiable;
__HTTPStatusCode HTTPStatusCodeLoginTimeout = HTTPStatusCodeIisLoginTimeout;
__HTTPStatusCode HTTPStatusCodeRetryWith = HTTPStatusCodeIisRetryWith;
__HTTPStatusCode HTTPStatusCodeNoResponse = HTTPStatusCodeNginxNoResponse;
__HTTPStatusCode HTTPStatusCodeCertError = HTTPStatusCodeNginxSSLCertificateError;
__HTTPStatusCode HTTPStatusCodeNoCert = HTTPStatusCodeNginxSSLCertificateRequired;
__HTTPStatusCode HTTPStatusCodeHTTPToHTTPS = HTTPStatusCodeNginxHTTPToHTTPS;
__HTTPStatusCode HTTPStatusCodeClientClosedRequest = HTTPStatusCodeNginxClientClosedRequest;
__HTTPStatusCode HTTPStatusCodeTwitterEnhanceYourCalm = HTTPStatusCodeTooManyRequests;

// MARK: - Removed

__HTTPStatusCode HTTPStatusCodeSwitchProxy = 306;
__HTTPStatusCode HTTPStatusCodeAuthenticationTimeout = 419;
__HTTPStatusCode HTTPStatusCodeSpringFrameworkMethodFailure = 419;
__HTTPStatusCode HTTPStatusCodeRequestHeaderTooLarge = 494;
__HTTPStatusCode HTTPStatusCodeNetworkTimeoutError = 599;
