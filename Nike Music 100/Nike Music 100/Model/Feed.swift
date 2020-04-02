//
//  Feed.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    
    // MARK: - Attributes
    let id: String
    let title: String
    let country: String
    let results: [Album]
}
