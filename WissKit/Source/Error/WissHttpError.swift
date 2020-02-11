//
// Created by Alan on 2020/02/06.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WissHttpError: WissError {

    var httpStatusCode: Int { get }

}


extension WissHttpError {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.httpStatusCode == rhs.httpStatusCode && lhs.code == rhs.code
    }

}
