# JSONRepresentable

This package defines two protocols: `JSONType` and `JSONRepresentable`.


## JSONType

Types which conform to `JSONType` can be directly represented in JSON.

The package adds conformance to Swift's basic types: `Bool`, `Int`, `Double`, `String`.

It defines a dictionary type `JSONDictionary`, with `String` keys and `JSONType` values.

It also defines an array type `JSONArray`, with `JSONType` values.


## JSONRepresentable

Types which conform to `JSONRepresentable` can be converted into a `JSONType`, using the  `asJSONType` method.

The package adds conformance to `JSONRepresentable` to various standard types:

- `Array` (where Element is `JSONRepresentable`)
- `CFString`
- `Date`
- `NSArray`
- `NSDate`
- `NSDictionary`
- `NSNumber`
- `NSNull`
- `NSString`
