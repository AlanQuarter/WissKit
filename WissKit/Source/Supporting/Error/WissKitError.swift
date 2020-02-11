//
// Created by Alan on 2020/02/07.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension WissKitError {

    static let unknown = Self(code: 0, message: "An error occurred, but there is no clear reason about it.")

    static let notInstanceIdentifiable = Self(code: 100, message: "The instance does not conform to 'InstanceIdentifiable'.")

}


struct WissKitError: WissError {

    var code: Int
    var message: String?

}
