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

const NSInteger HTTPStatusCodeRequestEntityTooLarge = HTTPStatusCodePayloadTooLarge;
const NSInteger HTTPStatusCodeRequestURITooLong = HTTPStatusCodeURITooLong;
const NSInteger HTTPStatusCodeRequestedRangeNotSatisfiable = HTTPStatusCodeRangeNotSatisfiable;
const NSInteger HTTPStatusCodeLoginTimeout = HTTPStatusCodeIISLoginTimeout;
const NSInteger HTTPStatusCodeRetryWith = HTTPStatusCodeIISRetryWith;
const NSInteger HTTPStatusCodeNoResponse = HTTPStatusCodeNginxNoResponse;
const NSInteger HTTPStatusCodeCertError = HTTPStatusCodeNginxSSLCertificateError;
const NSInteger HTTPStatusCodeNoCert = HTTPStatusCodeNginxSSLCertificateRequired;
const NSInteger HTTPStatusCodeHTTPToHTTPS = HTTPStatusCodeNginxHTTPToHTTPS;
const NSInteger HTTPStatusCodeClientClosedRequest = HTTPStatusCodeNginxClientClosedRequest;
const NSInteger HTTPStatusCodeTwitterEnhanceYourCalm = HTTPStatusCodeTooManyRequests;

// MARK: - Removed

const NSInteger HTTPStatusCodeSwitchProxy = 306;
const NSInteger HTTPStatusCodeAuthenticationTimeout = 419;
const NSInteger HTTPStatusCodeSpringFrameworkMethodFailure = 419;
const NSInteger HTTPStatusCodeRequestHeaderTooLarge = 494;
const NSInteger HTTPStatusCodeNetworkTimeoutError = 599;
