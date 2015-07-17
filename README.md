# SwiftHTTPStatusCodes
[![Build Status](https://travis-ci.org/rhodgkins/SwiftHTTPStatusCodes.svg?branch=master)](https://travis-ci.org/rhodgkins/SwiftHTTPStatusCodes)
[![Pod Version](http://img.shields.io/cocoapods/v/HTTPStatusCodes.svg)](http://cocoadocs.org/docsets/HTTPStatusCodes/)
[![Pod Platform](http://img.shields.io/cocoapods/p/HTTPStatusCodes.svg)](http://cocoadocs.org/docsets/HTTPStatusCodes/)
[![Pod License](http://img.shields.io/cocoapods/l/HTTPStatusCodes.svg)](http://opensource.org/licenses/MIT)
[![Dependency Status](https://www.versioneye.com/objective-c/HTTPStatusCodes/1.0.1/badge.svg)](https://www.versioneye.com/objective-c/HTTPStatusCodes/1.0.1)
[![Reference Status](https://www.versioneye.com/objective-c/HTTPStatusCodes/reference_badge.svg)](https://www.versioneye.com/objective-c/HTTPStatusCodes/references)

Swift enum wrapper for easier handling of HTTP status codes.

All the [RF2616](http://www.ietf.org/rfc/rfc2616.txt) standard status codes are supported with a few added ones from the [Wikipedia page](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

## Usage

With Cocoapods:
```
pod 'HTTPStatusCodes', '~> 1.0.1'
```

In your source file:
```swift
import HTTPStatusCodes
```

With Carthage:

```ogdl
github "rhodgkins/SwiftHTTPStatusCodes"
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
init?(URL url: NSURL, statusCode: HTTPStatusCode, HTTPVersion: String?, headerFields: [NSObject : AnyObject]?)
```
