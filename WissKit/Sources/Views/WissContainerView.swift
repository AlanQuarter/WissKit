//
// Created by Alan on 2020/02/25.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


public class WissContainerView<ContentView: UIView>: UIView {

    public weak var contentView: ContentView! {
        didSet  {
            self.refreshView()
        }
    }


    public var contentInsets = UIEdgeInsets.zero {
        didSet {
            self.refreshView()
        }
    }


    public init(contentInsets: UIEdgeInsets, contentView: ContentView) {
        super.init(frame: .zero)
        self.contentInsets = contentInsets
        self.contentView = contentView
    }


    public convenience init(contentInsets: UIEdgeInsets, contentViewMaker: () -> ContentView) {
        self.init(contentInsets: contentInsets, contentView: contentViewMaker())
    }

    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    private func refreshView() {
        guard let contentView = self.contentView else {
            return
        }

        for view in self.subviews {
            view.removeFromSuperview()
        }

        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(contentView)

        NSLayoutConstraint(
                item: contentView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: self,
                attribute: .leading,
                multiplier: 1,
                constant: self.contentInsets.left
        ).isActive = true

        NSLayoutConstraint(
                item: contentView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: self,
                attribute: .trailing,
                multiplier: 1,
                constant: -self.contentInsets.right
        ).isActive = true

        NSLayoutConstraint(
                item: contentView,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .top,
                multiplier: 1,
                constant: self.contentInsets.top
        ).isActive = true

        NSLayoutConstraint(
                item: contentView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self,
                attribute: .bottom,
                multiplier: 1,
                constant: -self.contentInsets.bottom
        ).isActive = true
    }

}
