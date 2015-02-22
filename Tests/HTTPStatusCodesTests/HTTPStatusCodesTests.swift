//
//  HTTPStatusCodesTests.swift
//  HTTPStatusCodesTests
//
//  Created by Richard Hodgkins on 22/02/2015.
//  Copyright (c) 2015 Rich H. All rights reserved.
//

import Foundation
import XCTest

import HTTPStatusCodes

private func response(statusCode: Int) -> NSHTTPURLResponse {
    return NSHTTPURLResponse(URL: NSURL(string: "http://www.google.com")!, statusCode: statusCode, HTTPVersion: nil, headerFields: nil)!
}
private func response(statusCode: HTTPStatusCode) -> NSHTTPURLResponse {
    return NSHTTPURLResponse(URL: NSURL(string: "http://www.google.com")!, statusCode: statusCode, HTTPVersion: nil, headerFields: nil)!
}

class HTTPStatusCodesTests: XCTestCase {
    
    func testNSHTTPURLResponseInit() {
        XCTAssertEqual(response(.Continue).statusCode, 100, "Incorrect status code")
        XCTAssertEqual(response(.OK).statusCode, 200, "Incorrect status code")
        XCTAssertEqual(response(.MultipleChoices).statusCode, 300, "Incorrect status code")
        XCTAssertEqual(response(.BadRequest).statusCode, 400, "Incorrect status code")
        XCTAssertEqual(response(.InternalServerError).statusCode, 500, "Incorrect status code")
    }
    
    func testComputedStatusCodeValueProperty() {
        XCTAssertEqual(response(100).statusCodeValue!, HTTPStatusCode.Continue, "Incorrect status code")
        XCTAssertEqual(response(200).statusCodeValue!, HTTPStatusCode.OK, "Incorrect status code")
        XCTAssertEqual(response(300).statusCodeValue!, HTTPStatusCode.MultipleChoices, "Incorrect status code")
        XCTAssertEqual(response(400).statusCodeValue!, HTTPStatusCode.BadRequest, "Incorrect status code")
        XCTAssertEqual(response(500).statusCodeValue!, HTTPStatusCode.InternalServerError, "Incorrect status code")
    }
    
    func testHTTPStatusCodeInit() {
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(100))!, HTTPStatusCode.Continue, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(200))!, HTTPStatusCode.OK, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(300))!, HTTPStatusCode.MultipleChoices, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(400))!, HTTPStatusCode.BadRequest, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(500))!, HTTPStatusCode.InternalServerError, "Incorrect status code")
    }
    
    func testBooleanRangeChecks() {
        for i in 100...199 {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertTrue(statusCode.isInformational, "Should be informational status code")
            }
        }
        for i in 200...299 {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertTrue(statusCode.isSuccess, "Should be success status code")
            }
        }
        for i in 300...399 {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertTrue(statusCode.isRedirection, "Should be redirection status code")
            }
        }
        for i in 400...499 {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertTrue(statusCode.isClientError, "Should be client error status code")
            }
        }
        for i in 500...599 {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertTrue(statusCode.isServerError, "Should be server error status code")
            }
        }
    }
}
