//
// Created by Alan on 2020/02/11.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension Wiss where WissBase: UITableView {

    public func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        self.base.register(cellClass, forCellReuseIdentifier: cellClass.wiss.reuseIdentifier)
    }


    public func register<View: UITableViewHeaderFooterView>(_ viewClass: View.Type) {
        self.base.register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.wiss.reuseIdentifier)
    }


    public func dequeueReusableCell<Cell: UITableViewCell>(_ cellClass: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = self.base.dequeueReusableCell(withIdentifier: cellClass.wiss.reuseIdentifier, for: indexPath) as? Cell else {
            return Cell()
        }
        
        return cell
    }


    public func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>(_ viewClass: View.Type) -> View? {
        guard let view = self.base.dequeueReusableHeaderFooterView(withIdentifier: viewClass.wiss.reuseIdentifier) as? View else {
            return nil
        }

        return view
    }

}
