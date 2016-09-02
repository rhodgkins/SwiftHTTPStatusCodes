//
//  HTTPStatusCodesTests.swift
//  HTTPStatusCodesTests
//
//  Created by Richard Hodgkins on 22/02/2015.
//  Copyright (c) 2015 Rich H. All rights reserved.
//

import Foundation

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

private func response(_ statusCode: Int) -> HTTPURLResponse {
    return HTTPURLResponse(url: URL(string: "http://www.google.com")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}
private func response(_ statusCode: HTTPStatusCode) -> HTTPURLResponse {
    return HTTPURLResponse(url: NSURL(string: "http://www.google.com")! as URL, statusCode: statusCode.rawValue, httpVersion: nil, headerFields: nil)!
}

final class HTTPStatusCodesTests: XCTestCase {
    
    func testNSHTTPURLResponseInit() {
        XCTAssertEqual(response(.continue).statusCode, 100, "Incorrect status code")
        XCTAssertEqual(response(.ok).statusCode, 200, "Incorrect status code")
        XCTAssertEqual(response(.multipleChoices).statusCode, 300, "Incorrect status code")
        XCTAssertEqual(response(.badRequest).statusCode, 400, "Incorrect status code")
        XCTAssertEqual(response(.internalServerError).statusCode, 500, "Incorrect status code")
    }
    
    func testComputedStatusCodeValueProperty() {
        XCTAssertEqual(response(100).statusCodeValue!, HTTPStatusCode.continue, "Incorrect status code")
        XCTAssertEqual(response(200).statusCodeValue!, HTTPStatusCode.ok, "Incorrect status code")
        XCTAssertEqual(response(300).statusCodeValue!, HTTPStatusCode.multipleChoices, "Incorrect status code")
        XCTAssertEqual(response(400).statusCodeValue!, HTTPStatusCode.badRequest, "Incorrect status code")
        XCTAssertEqual(response(500).statusCodeValue!, HTTPStatusCode.internalServerError, "Incorrect status code")
    }
    
#if DEBUG
    func testComputedStatusCodeEnumProperty() {
        XCTAssertEqual(response(100).statusCodeEnum, HTTPStatusCode.continue, "Incorrect status code")
        XCTAssertEqual(response(200).statusCodeEnum, HTTPStatusCode.ok, "Incorrect status code")
        XCTAssertEqual(response(300).statusCodeEnum, HTTPStatusCode.multipleChoices, "Incorrect status code")
        XCTAssertEqual(response(400).statusCodeEnum, HTTPStatusCode.badRequest, "Incorrect status code")
        XCTAssertEqual(response(500).statusCodeEnum, HTTPStatusCode.internalServerError, "Incorrect status code")
    }
#endif

    func testHTTPStatusCodeInit() {
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(100))!, HTTPStatusCode.continue, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(200))!, HTTPStatusCode.ok, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(300))!, HTTPStatusCode.multipleChoices, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(400))!, HTTPStatusCode.badRequest, "Incorrect status code")
        XCTAssertEqual(HTTPStatusCode(HTTPResponse: response(500))!, HTTPStatusCode.internalServerError, "Incorrect status code")
    }
    
    func testValidBooleanRangeChecks() {
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
    
    func testInvalidBooleanRangeChecks() {
        
        /// 0...1000 - `ignoredRange`
        func range(ignoringRange ignoredRange: ClosedRange<Int>) -> [Int] {
            return (0...1000).filter { !ignoredRange.contains($0) }
        }
        
        for i in range(ignoringRange: 100...199) {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertFalse(statusCode.isInformational, "Should be not informational status code")
            }
        }
        for i in range(ignoringRange: 200...299) {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertFalse(statusCode.isSuccess, "Should be not success status code")
            }
        }
        for i in range(ignoringRange: 300...399) {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertFalse(statusCode.isRedirection, "Should be not redirection status code")
            }
        }
        for i in range(ignoringRange: 400...499) {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertFalse(statusCode.isClientError, "Should be not client error status code")
            }
        }
        for i in range(ignoringRange: 500...599) {
            if let statusCode = HTTPStatusCode(rawValue: i) {
                XCTAssertFalse(statusCode.isServerError, "Should be not server error status code")
            }
        }
    }
    
    func testReasonPhrase() {
        XCTAssertEqual(HTTPStatusCode.continue.localizedReasonPhrase, HTTPURLResponse.localizedString(forStatusCode: HTTPStatusCode.continue.rawValue))
        
        XCTAssertEqual(HTTPStatusCode.ok.localizedReasonPhrase, HTTPURLResponse.localizedString(forStatusCode: HTTPStatusCode.ok.rawValue))
        
        XCTAssertEqual(HTTPStatusCode.multipleChoices.localizedReasonPhrase, HTTPURLResponse.localizedString(forStatusCode: HTTPStatusCode.multipleChoices.rawValue))
        
        XCTAssertEqual(HTTPStatusCode.badRequest.localizedReasonPhrase, HTTPURLResponse.localizedString(forStatusCode: HTTPStatusCode.badRequest.rawValue))
        
        XCTAssertEqual(HTTPStatusCode.internalServerError.localizedReasonPhrase, HTTPURLResponse.localizedString(forStatusCode: HTTPStatusCode.internalServerError.rawValue))
    }
    
    func testDescription() {
        XCTAssertEqual(String(describing: HTTPStatusCode.continue), "\(HTTPStatusCode.continue.rawValue) - \(HTTPStatusCode.continue.localizedReasonPhrase)")
        
        XCTAssertEqual(String(describing: HTTPStatusCode.ok), "\(HTTPStatusCode.ok.rawValue) - \(HTTPStatusCode.ok.localizedReasonPhrase)")
        
        XCTAssertEqual(String(describing: HTTPStatusCode.multipleChoices), "\(HTTPStatusCode.multipleChoices.rawValue) - \(HTTPStatusCode.multipleChoices.localizedReasonPhrase)")
        
        XCTAssertEqual(String(describing: HTTPStatusCode.badRequest), "\(HTTPStatusCode.badRequest.rawValue) - \(HTTPStatusCode.badRequest.localizedReasonPhrase)")
        
        XCTAssertEqual(String(describing: HTTPStatusCode.internalServerError), "\(HTTPStatusCode.internalServerError.rawValue) - \(HTTPStatusCode.internalServerError.localizedReasonPhrase)")
    }
    
    func testDebugDescription() {
        XCTAssertEqual(String(reflecting: HTTPStatusCode.continue), "HTTPStatusCode:\(HTTPStatusCode.continue.rawValue) - \(HTTPStatusCode.continue.localizedReasonPhrase)")
        
        XCTAssertEqual(String(reflecting: HTTPStatusCode.ok), "HTTPStatusCode:\(HTTPStatusCode.ok.rawValue) - \(HTTPStatusCode.ok.localizedReasonPhrase)")
        
        XCTAssertEqual(String(reflecting: HTTPStatusCode.multipleChoices), "HTTPStatusCode:\(HTTPStatusCode.multipleChoices.rawValue) - \(HTTPStatusCode.multipleChoices.localizedReasonPhrase)")
        
        XCTAssertEqual(String(reflecting: HTTPStatusCode.badRequest), "HTTPStatusCode:\(HTTPStatusCode.badRequest.rawValue) - \(HTTPStatusCode.badRequest.localizedReasonPhrase)")
        
        XCTAssertEqual(String(reflecting: HTTPStatusCode.internalServerError), "HTTPStatusCode:\(HTTPStatusCode.internalServerError.rawValue) - \(HTTPStatusCode.internalServerError.localizedReasonPhrase)")
    }
    
    func testBadStatusCodes() {
        XCTAssertTrue(HTTPStatusCode(rawValue: 1000) == nil)
        XCTAssertTrue(HTTPStatusCode(HTTPResponse: nil) == nil)
        XCTAssertTrue(HTTPStatusCode(HTTPResponse: response(1000)) == nil)
    }
}

#endif
