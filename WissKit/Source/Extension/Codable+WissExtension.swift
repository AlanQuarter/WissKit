//
// Created by Alan on 2020/02/20.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension Encodable {

    public func wiss_jsonString() throws -> String {
        let data = try JSONEncoder().encode(self)

        guard let json = String(data: data, encoding: .utf8) else {
            var error = WissKitError.encodingFailed
            error.message = "The encoding for the value \(self) was failed."
            throw error
        }

        return json
    }

}
