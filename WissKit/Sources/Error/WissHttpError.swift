//
// Created by Alan on 2020/02/06.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WissHttpError: WissError {

    var httpStatusCode: Int { get }

}
