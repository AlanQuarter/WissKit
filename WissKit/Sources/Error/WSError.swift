//
// Created by Alan on 2020/02/04.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WSError: LocalizedError, CustomStringConvertible {

    static var unknown: Self { get }

    var code: Int { get set }
    var message: String? { get set }

}


extension WSError {

    public init?(_ error: Error) {
        guard let wsError = error as? Self else {
            return nil
        }

        self = wsError
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
