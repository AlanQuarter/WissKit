//
// Created by Alan on 2020/02/07.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WissInstanceIdentifiable {

    var wiss_InstanceId: String { get }

}


extension Hashable {

    public var wiss_InstanceId: String {
        "\(self.hashValue)"
    }

}


extension Bool: WissInstanceIdentifiable {}

extension Int: WissInstanceIdentifiable {}
extension Int8: WissInstanceIdentifiable {}
extension Int16: WissInstanceIdentifiable {}
extension Int32: WissInstanceIdentifiable {}
extension Int64: WissInstanceIdentifiable {}
extension UInt: WissInstanceIdentifiable {}
extension UInt8: WissInstanceIdentifiable {}
extension UInt16: WissInstanceIdentifiable {}
extension UInt32: WissInstanceIdentifiable {}
extension UInt64: WissInstanceIdentifiable {}

extension Float: WissInstanceIdentifiable {}
extension Float80: WissInstanceIdentifiable {}

extension Double: WissInstanceIdentifiable {}

extension String: WissInstanceIdentifiable {}
extension NSString: WissInstanceIdentifiable {}
extension Character: WissInstanceIdentifiable {}
