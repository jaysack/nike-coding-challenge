//
//  UIStackView+Extension.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/4/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

extension UIStackView {

    func setDefaultConfig(spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis = .vertical, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) {

        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
}
