//
//  Created by Alan on 2020/02/04.
//  Copyright © 2020 Wiss. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(WSTableViewCell.wiss.reuseIdentifier)
    }

}


struct VM {}


class WSTableViewCell: UITableViewCell {

    var viewModel: VM!


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
