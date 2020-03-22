//
// Created by Alan on 2020/02/11.
// Copyright (c) 2020 Wiss. All rights reserved.
//


#if os(iOS)

import Foundation
import UIKit


public protocol ReusableView: UIView {}


extension Wiss where WissBase: ReusableView {

    public static var reuseIdentifier: String {
        "\(WissBase.self)"
    }

}


extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}

extension UICollectionReusableView: ReusableView {}

#endif
