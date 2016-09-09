# SwiftHTTPStatusCodes
[![Build Status](https://travis-ci.org/rhodgkins/SwiftHTTPStatusCodes.svg?branch=master)](https://travis-ci.org/rhodgkins/SwiftHTTPStatusCodes)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Version](http://img.shields.io/cocoapods/v/HTTPStatusCodes.svg)](http://cocoadocs.org/docsets/HTTPStatusCodes/)
[![Pod Platform](http://img.shields.io/cocoapods/p/HTTPStatusCodes.svg)](http://cocoadocs.org/docsets/HTTPStatusCodes/)
[![Pod License](http://img.shields.io/cocoapods/l/HTTPStatusCodes.svg)](http://opensource.org/licenses/MIT)

Swift enum wrapper for easier handling of HTTP status codes. 

The purpose of this library is to improve to clarify of code and remove the need for checking of status codes as numbers (`==200`), or as a range of values (`== 2xx`) - instead replacing it with descriptive enums.

All the [RF2616](http://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) standard status codes are supported with a few added ones from the [Wikipedia page](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

As of version 3.0.0 of this framework, the list of status codes are directly generated from a [online IANA CSV](http://www.iana.org/assignments/http-status-codes/http-status-codes-1.csv). The [HTML page](http://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) has a last updated field, and this is also mirrored in the header comments to identify which version this framework is currently using.<br/>
If this library is out of date compared to this page please open an issue and I will update the list.

## Usage

Swift 3.0 support is added in version 3.1 of this framework. For use with older versions of Swift use version 3.0.

### Carthage

`Cartfile`:
```ogdl
github "rhodgkins/SwiftHTTPStatusCodes" ~> 3.1
```
Source code:
```swift
import HTTPStatusCodes
```

### CocoaPods
`Podfile`:
```ruby
pod 'HTTPStatusCodes', '~> 3.1.0'
```
Source code:

```swift
import HTTPStatusCodes
```

### Manually
Or drop in the Swift files inside the [`Sources folder`](https://github.com/rhodgkins/SwiftHTTPStatusCodes/tree/master/Sources) into your project.

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
