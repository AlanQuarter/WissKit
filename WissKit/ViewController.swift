//
//  Created by Alan on 2020/02/04.
//  Copyright © 2020 Wiss. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


public struct RenderingSize {

    public let width: CGFloat
    public let height: CGFloat


    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }


    init(size: CGSize) {
        self.width = size.width
        self.height = size.height
    }

}


public struct RenderingSizeConstraints {

    var width: (CGFloat) -> Bool
    var height: (CGFloat) -> Bool


    init(widthConstraints: @escaping (CGFloat) -> Bool = { _ in true }, heightConstraints: @escaping (CGFloat) -> Bool = { _ in true }) {
        self.width = widthConstraints
        self.height = heightConstraints
    }

}


public class RenderingSizeConstraintsMaker {

    var constraints = RenderingSizeConstraints()

    func width(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ value: CGFloat) -> Self {
        self.constraints.width = { relation($0, value) }
        return self
    }


    func height(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ value: CGFloat) -> Self {
        self.constraints.width = { relation($0, value) }
        return self
    }

}
