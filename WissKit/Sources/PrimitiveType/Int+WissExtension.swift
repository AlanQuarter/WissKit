//
// Created by Alan on 2020/02/06.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension Int {

    init(_ source: Bool) {
        self.init(source == true ? 1 : 0)
    }


    init?(_ source: Bool?) {
        guard let actualSource = source else {
            return nil
        }

        self.init(actualSource)
    }

}
