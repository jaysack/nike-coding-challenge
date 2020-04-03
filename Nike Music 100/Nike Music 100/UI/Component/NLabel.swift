//
//  NLabel.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class NLabel: UILabel {
    
    // MARK: - Init Method
    convenience init(title: String, font: UIFont?, textColor: UIColor?, allowMultiline: Bool = true) {
        self.init()
        
        // Config.
        self.text = title
        self.numberOfLines = allowMultiline ? 0 : 1

        // Font
        if let font = font {
            self.font = font
        }
        
        // Color
        if let color = textColor {
            self.textColor = color
        }
    }
}
