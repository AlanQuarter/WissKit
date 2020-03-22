//
//  Created by Alan on 2020/03/22.
//  Copyright © 2020 Wiss. All rights reserved.
//


#if os(iOS)

import Foundation
import UIKit


public class ScreenSizeBasedCGFloatConstraints {

    private weak var picker: ScreenSizeBasedCGFloatPicker?
    public let condition: (CGSize) -> Bool
    public private(set) var value: CGFloat = 0


    init(for picker: ScreenSizeBasedCGFloatPicker, constraints: @escaping (CGSize) -> Bool) {
        self.picker = picker
        self.condition = constraints
    }


    public func width(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloatConstraints {
        guard let picker = self.picker else {
            return self
        }

        return ScreenSizeBasedCGFloatConstraints(for: picker) { [weak self] size in
            var result = true

            if let previous = self?.condition(size) {
                result = previous
            }

            result = result && relation(size.width, criteria)
            return result
        }
    }


    public func height(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloatConstraints {
        guard let picker = self.picker else {
            return self
        }

        return ScreenSizeBasedCGFloatConstraints(for: picker) { [weak self] size in
            var result = true

            if let previous = self?.condition(size) {
                result = previous
            }

            result = result && relation(size.height, criteria)
            return result
        }
    }


    public func replace(to value: CGFloat) {
        self.value = value
        self.picker?.constraints.append(self)
    }

}

#endif
