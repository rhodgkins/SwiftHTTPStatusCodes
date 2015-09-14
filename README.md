# SwiftHTTPStatusCodes
[![Build Status](https://travis-ci.org/rhodgkins/SwiftHTTPStatusCodes.svg?branch=master)](https://travis-ci.org/rhodgkins/SwiftHTTPStatusCodes)
[![Pod Version](http://img.shields.io/cocoapods/v/HTTPStatusCodes.svg)](http://cocoadocs.org/docsets/HTTPStatusCodes/)
[![Pod Platform](http://img.shields.io/cocoapods/p/HTTPStatusCodes.svg)](http://cocoadocs.org/docsets/HTTPStatusCodes/)
[![Pod License](http://img.shields.io/cocoapods/l/HTTPStatusCodes.svg)](http://opensource.org/licenses/MIT)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Swift enum wrapper for easier handling of HTTP status codes. 

The purpose of this library is to improve to clarify of code and remove the need for checking of status codes as numbers (`==200`), or as a range of values (`== 2xx`) - instead replacing it with descriptive enums.

All the [RF2616](http://www.ietf.org/rfc/rfc2616.txt) standard status codes are supported with a few added ones from the [Wikipedia page](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

## Usage

With Cocoapods:
```
pod 'HTTPStatusCodes', '~> 2.0.0'
```

With Carthage:

```ogdl
github "rhodgkins/SwiftHTTPStatusCodes" ~> 2.0
```

In your source file:
```swift
import HTTPStatusCodes
```

Or drop `HTTPStatusCodes.swift` into your project.

## Helper methods

There are `Bool` properties on the enum for checking if a status code is of a certain category:
```swift
isInformational
isSuccess
isRedirection
isClientError
isServerError
```

There is also an extension on `NSHTTPURLResponse` to obtain a status code enum directly and to `init` with one:
```swift
var statusCodeValue: HTTPStatusCode?
init?(URL url: NSURL, statusCode: HTTPStatusCode, HTTPVersion: String?, headerFields: [String : String]?)
```
