//
// Created by Alan on 2020/02/04.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WSError: LocalizedError {

    static var unknown: Self { get }

    var code: Int { get }
    var message: String? { get }

    init(code: Int, message: String?)

}


extension WSError {

    init(_ error: Error) {
        if let wsError = error as? Self {
            self.init(code: wsError.code, message: wsError.message)
        } else {
            self.init(code: Self.unknown.code, message: error.localizedDescription)
        }
    }


    var errorDescription: String? {
        self.message
    }


    static func ~=(match: Self, error: Error) -> Bool {
        match.code == Self(error).code
    }

}
