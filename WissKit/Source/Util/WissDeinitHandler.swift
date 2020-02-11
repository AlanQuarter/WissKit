//
// Created by Alan on 2020/02/07.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public class WissDeinitHandler {

    public let onDeinit: () -> Void


    init(onDeinit: @escaping () -> Void) {
        self.onDeinit = onDeinit
    }


    deinit {
        self.onDeinit()
    }

}
