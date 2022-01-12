//
//  JSONRepresentable.swift
//  BookishLists
//
//  Created by Sam Deane on 12/01/2022.
//

import Foundation
import Accessibility

public protocol JSONType {
    var asJSONType: JSONType { get }
}

public extension JSONType {
    var asJSONType: JSONType {
        return self
    }
}

public protocol JSONRepresentable {
    var asJSONType: JSONType { get }
}

public typealias JSONDictionary = Dictionary<String, JSONType>
public typealias JSONArray = Array<JSONType>

extension Bool: JSONType { }
extension Int: JSONType { }
extension Double: JSONType { }
extension String: JSONType { }
extension JSONDictionary: JSONType { }
extension JSONArray: JSONType { }

// MARK: Swift Foundation Types

extension Date: JSONRepresentable {
    public var asJSONType: JSONType {
        return DateFormatter.localizedString(from: self, dateStyle: .full, timeStyle: .full)
    }
}

extension Array: JSONRepresentable where Element: JSONRepresentable {
    public var asJSONType: JSONType {
        return self.map { item in item.asJSONType }
    }
}

// MARK: Core Foundation Types

extension CFString: JSONRepresentable {
    public var asJSONType: JSONType { return self as String }
}

// MARK: ObjC Foundation Types

extension NSArray: JSONRepresentable {
    public var asJSONType: JSONType {
        return self.map { (item: Any) -> JSONType in
            return (item as! JSONRepresentable).asJSONType
        }
    }
}

extension NSDictionary: JSONRepresentable {
    public var asJSONType: JSONType {
        var mapped = JSONDictionary()
        for (key, value) in self {
            mapped[key as! String] = (value as! JSONRepresentable).asJSONType
        }
        return mapped
    }
}

extension NSString: JSONRepresentable {
    public var asJSONType: JSONType {
        return self as String
    }
}

extension NSDate: JSONRepresentable {
    public var asJSONType: JSONType {
        return DateFormatter.localizedString(from: self as Date, dateStyle: .full, timeStyle: .full)
    }
}
