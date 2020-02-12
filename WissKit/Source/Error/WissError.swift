//
// Created by Alan on 2020/02/06.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WissError: Error, Equatable {

    var code: Int { get }
    var message: String { get }

}


extension WissError {

    public init?(_ error: Error?) {
        guard let wissError = error as? Self else {
            return nil
        }

        error?.localizedDescription

        self = wissError
    }


    public var localizedDescription: String {
        self.message.wiss.localized
    }


    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.code == rhs.code
    }


    public static func ~= (pattern: Self, value: Error?) -> Bool {
        pattern == Self(value)
    }

}
