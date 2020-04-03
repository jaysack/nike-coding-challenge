//
//  UIColor+Extension.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

extension UIColor {

    // MARK: - Custom Colors
    static var NFakeWhite: UIColor? { return UIColor(hex: "#F3F3F3") }
    static var NSilver: UIColor? { return UIColor(hex: "#DCDCDC") }
    static var NWhite: UIColor? { return UIColor(hex: "#FFFFFF") }
    static var NBlack: UIColor? { return UIColor(hex: "#000000") }
    static var NGray: UIColor? { return UIColor(hex: "#A9A9A9") }

    
    // MARK: - HEX Colors
    public convenience init?(hex: String) {
        let r, g, b: CGFloat

        if hex.hasPrefix("#") {
            let fullHexCode = hex + "FF"
            let start = fullHexCode.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(fullHexCode[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        }

        return nil
    }
}
