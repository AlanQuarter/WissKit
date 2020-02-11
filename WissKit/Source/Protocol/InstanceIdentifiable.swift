//
// Created by Alan on 2020/02/07.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol InstanceIdentifiable {

    var wiss_instanceId: String { get }

}


extension Hashable {

    public var wiss_instanceId: String {
        "\(self.hashValue)"
    }

}


extension Bool: InstanceIdentifiable {}

extension Int: InstanceIdentifiable {}
extension Int8: InstanceIdentifiable {}
extension Int16: InstanceIdentifiable {}
extension Int32: InstanceIdentifiable {}
extension Int64: InstanceIdentifiable {}
extension UInt: InstanceIdentifiable {}
extension UInt8: InstanceIdentifiable {}
extension UInt16: InstanceIdentifiable {}
extension UInt32: InstanceIdentifiable {}
extension UInt64: InstanceIdentifiable {}

extension Float: InstanceIdentifiable {}
extension Float80: InstanceIdentifiable {}

extension Double: InstanceIdentifiable {}

extension String: InstanceIdentifiable {}
extension NSString: InstanceIdentifiable {}
extension Character: InstanceIdentifiable {}
