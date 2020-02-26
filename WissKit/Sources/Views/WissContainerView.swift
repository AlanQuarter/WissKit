//
// Created by Alan on 2020/02/25.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


public class WissContainerView<ContentView: UIView>: UIView {

    public weak var contentView: ContentView! {
        didSet  {
            self.refresh(self.contentView)
        }
    }


    public var contentInsets = UIEdgeInsets.zero {
        didSet {
            self.refreshView(self.contentView)
        }
    }


    public init(contentInsets: UIEdgeInsets, contentView: ContentView) {
        super.init(frame: .zero)
        self.contentInsets = contentInsets
        self.contentView = contentView
    }


    public convenience init(contentInsets: UIEdgeInsets, contentViewBuilder: () -> ContentView) {
        self.init(contentInsets: contentInsets, contentView: contentViewBuilder())
    }

    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    func refresh(_ contentView: ContentView?) {
        guard let view = contentView else {
            return
        }

        for subview in self.subviews {
            subview.removeFromSuperview()
        }

        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(view)

        NSLayoutConstraint(
                item: view,
                attribute: .leading,
                relatedBy: .equal,
                toItem: self,
                attribute: .leading,
                multiplier: 1,
                constant: self.contentInsets.left
        ).isActive = true

        NSLayoutConstraint(
                item: view,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: self,
                attribute: .trailing,
                multiplier: 1,
                constant: -self.contentInsets.right
        ).isActive = true

        NSLayoutConstraint(
                item: view,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .top,
                multiplier: 1,
                constant: self.contentInsets.top
        ).isActive = true

        NSLayoutConstraint(
                item: view,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self,
                attribute: .bottom,
                multiplier: 1,
                constant: -self.contentInsets.bottom
        ).isActive = true
    }

}
