//
// Created by Alan on 2020/02/07.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


protocol WissEquatable {

    func wiss_isEqual<T>(to other: T) -> Bool

}


extension Equatable {

    public func wiss_isEqual<T>(to other: T) -> Bool {
        guard let equatableOther = other as? Self else {
            return false
        }

        return self == equatableOther
    }

}


extension Bool: WissEquatable {}

extension Int: WissEquatable {}
extension Int8: WissEquatable {}
extension Int16: WissEquatable {}
extension Int32: WissEquatable {}
extension Int64: WissEquatable {}
extension UInt: WissEquatable {}
extension UInt8: WissEquatable {}
extension UInt16: WissEquatable {}
extension UInt32: WissEquatable {}
extension UInt64: WissEquatable {}

extension Float: WissEquatable {}
extension Float80: WissEquatable {}

extension Double: WissEquatable {}

extension String: WissEquatable {}
extension NSString: WissEquatable {}
extension Character: WissEquatable {}
