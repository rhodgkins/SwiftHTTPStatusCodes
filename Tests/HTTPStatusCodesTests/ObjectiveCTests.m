//
//  ObjectiveCTests.m
//  HTTPStatusCodes
//
//  Created by Richard Hodgkins on 12/10/2016.
//  Copyright © 2016 Rich H. All rights reserved.
//

@import Foundation;

#if TARGET_OS_WATCH
// No testing supported
#else

@import XCTest;
@import HTTPStatusCodes;

#import <HTTPStatusCodes/HTTPStatusCodes-Swift.h>

static NSHTTPURLResponse *_Nullable response(HTTPStatusCode statusCode) {
    return [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"http://www.google.com"] statusCodeValue:statusCode HTTPVersion:nil headerFields:nil];
}

@interface ObjectiveCTests : XCTestCase

@end

@implementation ObjectiveCTests

-(void)testComputedStatusCodeValueProperty
{
    XCTAssertEqual(response(HTTPStatusCodeContinue).statusCodeValue, HTTPStatusCodeContinue, @"Incorrect status code");
    XCTAssertEqual(response(HTTPStatusCodeOK).statusCodeValue, HTTPStatusCodeOK, @"Incorrect status code");
    XCTAssertEqual(response(HTTPStatusCodeMultipleChoices).statusCodeValue, HTTPStatusCodeMultipleChoices, @"Incorrect status code");
    XCTAssertEqual(response(HTTPStatusCodeBadRequest).statusCodeValue, HTTPStatusCodeBadRequest, @"Incorrect status code");
    XCTAssertEqual(response(HTTPStatusCodeInternalServerError).statusCodeValue, HTTPStatusCodeInternalServerError, @"Incorrect status code");
}

-(void)testNSHTTPURLResponseInit
{
    XCTAssertEqual([[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"http://www.google.com"] statusCodeValue:HTTPStatusCodeOK HTTPVersion:nil headerFields:nil].statusCode, 200);
    XCTAssertEqual([[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"http://www.google.com"] statusCodeValue:HTTPStatusCodeOK HTTPVersion:nil headerFields:nil].statusCode, HTTPStatusCodeOK);
    XCTAssertEqual([[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"http://www.google.com"] statusCodeValue:HTTPStatusCodeOK HTTPVersion:nil headerFields:nil].statusCodeValue, HTTPStatusCodeOK);
}

@end
#endif
