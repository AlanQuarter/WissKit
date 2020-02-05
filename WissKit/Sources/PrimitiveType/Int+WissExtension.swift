//
// Created by Alan on 2020/02/06.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension Int {

    public init(_ source: Bool) {
        self.init(source == true ? 1 : 0)
    }


    public init?(_ source: Bool?) {
        guard let actualSource = source else {
            return nil
        }

        self.init(actualSource)
    }

}
