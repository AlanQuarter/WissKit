//
// Created by Alan on 2020/02/25.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


public class WissContainerView<ContentView: UIView>: UIView {

    public private(set) var contentInsets = UIEdgeInsets.zero

    public private(set) weak var contentView: ContentView!


    public init(contentInsets: UIEdgeInsets, contentView: ContentView) {
        super.init(frame: .zero)

        self.contentInsets = contentInsets
        self.set(contentView: contentView)
    }


    public convenience init(contentInsets: UIEdgeInsets, contentViewBuilder: () -> ContentView) {
        self.init(contentInsets: contentInsets, contentView: contentViewBuilder())
    }

    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    public func set(contentInsets: UIEdgeInsets, animated: Bool = false, completion: @escaping (Bool) -> Void = { _ in }) {
        self.contentInsets = contentInsets

        if animated {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                guard let strongSelf = self else {
                    return
                }

                strongSelf.set(contentView: strongSelf.contentView)
                strongSelf.layoutIfNeeded()
            }, completion: completion)
        } else {
            self.set(contentView: self.contentView)
            completion(true)
        }
    }


    public func set(contentView: ContentView) {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }

        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        self.contentView = contentView

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


    public func set(contentView contentViewBuilder: () -> ContentView) {
        self.set(contentView: contentViewBuilder())
    }

}
