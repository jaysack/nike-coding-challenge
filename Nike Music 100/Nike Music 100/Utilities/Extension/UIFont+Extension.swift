//
//  UIFont+Extension.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

extension UIFont {
    static var NTitle: UIFont? { return UIFont(name: "Futura-CondensedMedium", size: 16) }
    static var NTitleLarge: UIFont? { return UIFont(name: "Futura-CondensedExtraBold", size: 42) }
    static var NTitleBold: UIFont? { return UIFont(name: "Futura-CondensedExtraBold", size: 16) }
    static var NSubtitle: UIFont? { return UIFont.systemFont(ofSize: 18, weight: .semibold) }
}
