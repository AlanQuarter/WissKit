//
// Created by Alan on 2020/02/04.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WSHttpError: WSError {

    var httpStatusCode: Int { get set }

}
