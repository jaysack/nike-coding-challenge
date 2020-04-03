//
//  UIView+Extension.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - Individual Constraints
    func setConstraint(topAnchor: NSLayoutYAxisAnchor? = nil,
                       topConstant: CGFloat = 0,
                       bottomAnchor: NSLayoutYAxisAnchor? = nil,
                       bottomConstant: CGFloat = 0,
                       leadingAnchor: NSLayoutXAxisAnchor? = nil,
                       leadingConstant: CGFloat = 0,
                       trailingAnchor: NSLayoutXAxisAnchor? = nil,
                       trailingConstant: CGFloat = 0,
                       centerXAnchor: NSLayoutXAxisAnchor? = nil,
                       centerXConstant: CGFloat = 0,
                       centerYAnchor: NSLayoutYAxisAnchor? = nil,
                       centerYConstant: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false

        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
        }
        if let bottomAnchor = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomConstant).isActive = true
        }
        if let leadingAnchor = leadingAnchor {
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstant).isActive = true
        }
        if let trailingAnchor = trailingAnchor {
            self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -trailingConstant).isActive = true
        }
        if let centerXAnchor = centerXAnchor {
            self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: centerXConstant).isActive = true
        }
        if let centerYAnchor = centerYAnchor {
            self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: centerYConstant).isActive = true
        }
    }
    
    
    // MARK: - Pin to Superview
    func pinTo(superview: UIView, xPadding: CGFloat = 0, yPadding: CGFloat = 0) {
        superview.addSubview(self)
        self.setConstraint(topAnchor: superview.topAnchor,
                           topConstant: yPadding,
                           bottomAnchor: superview.bottomAnchor,
                           bottomConstant: yPadding,
                           leadingAnchor: superview.leadingAnchor,
                           leadingConstant: xPadding,
                           trailingAnchor: superview.trailingAnchor,
                           trailingConstant: xPadding)
    }


    // MARK: - Center in Superview
    func centerIn(superview: UIView, xAdjustment: CGFloat = 0, yAdjustment: CGFloat = 0) {
        superview.addSubview(self)
        self.setConstraint(centerXAnchor: superview.centerXAnchor,
                           centerXConstant: xAdjustment,
                           centerYAnchor: superview.centerYAnchor,
                           centerYConstant: yAdjustment)
    }


    // MARK: - Size Constraints
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

}
