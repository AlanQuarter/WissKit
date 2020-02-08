//
//  Created by Alan on 2020/02/04.
//  Copyright © 2020 Wiss. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let oldStyleMargin: CGFloat

        if UIScreen.main.bounds.width < 640,
           UIScreen.main.bounds.height < 1280 {
            oldStyleMargin = 14
        } else if UIScreen.main.bounds.width == 320 {
            oldStyleMargin = 10
        } else {
            oldStyleMargin = 16
        }

        let brandNewMargin = CGFloat(16) { picker in
            picker.width(<, 640).height(<, 1280).replace(to: 14)
            picker.width(==, 320).replace(to: 10)
        }

        print(brandNewMargin)
        print(oldStyleMargin == brandNewMargin)
    }

}
