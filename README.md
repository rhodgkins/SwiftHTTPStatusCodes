# SwiftHTTPStatusCodes
Swift enum wrapper for easier handling of HTTP status codes.

All the [RF2616](http://www.ietf.org/rfc/rfc2616.txt) standard status codes are supported with a few added ones from the [Wikipedia page](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

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
