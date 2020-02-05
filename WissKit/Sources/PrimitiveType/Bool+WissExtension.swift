//
// Created by Alan on 2020/02/06.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension Bool {

    init(_ source: Int) {
        self.init(source != 0)
    }


    init?(_ source: Int?) {
        guard let actualSource = source else {
            return nil
        }

        self.init(actualSource)
    }

}
