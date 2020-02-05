//
// Created by Alan on 2020/02/06.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WissError: LocalizedError, CustomStringConvertible {

    var code: Int { get }
    var message: String? { get }

}


extension WissError {

    public init?(_ error: Error) {
        guard let wissError = error as? Self else {
            return nil
        }

        self = wissError
    }


    public var errorDescription: String? {
        self.message
    }

    public var description: String {
        self.message ?? ""
    }


    public static func ~=(match: Self, error: Error) -> Bool {
        error is Self && match.code == Self(error)?.code
    }

}
