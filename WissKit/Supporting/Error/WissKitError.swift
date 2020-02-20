//
// Created by Alan on 2020/02/07.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension WissKitError {

    static let unknown = WissKitError(code: 0, message: "An error occurred, but there is no clear reason about it.")

    static let encodingFailed = WissKitError(code: 100, message: "The encoding for the value was failed.")
    static let decodingFailed = WissKitError(code: 101, message: "The decoding for the value was failed.")

    static let userDefaultsNotFound = WissKitError(code: 200, message: "The user defaults instance for the 'WissStore' is nil.")
    static let valueNotCodable = WissKitError(code: 201, message: "A value stored in the user defaults must conform to 'Codable'.")
    static let userDefaultsNotAvailable = WissKitError(code: 202, message: "An instance can not hold a value stored in the user defaults.")


}


struct WissKitError: WissError {

    var code: Int
    var message: String?

}
