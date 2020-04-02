//
//  Genre.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import Foundation

struct Genre: Decodable {
    
    // MARK: - Attributes
    let id: String
    let name: String
    let url: String
    
    
    // MARK: - Decodable Enum
    private enum CodingKeys: String, CodingKey {
        case id = "genreId"
        case name, url
    }
}
