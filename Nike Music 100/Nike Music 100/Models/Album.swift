//
//  Album.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import Foundation

struct Album: Decodable {
    
    // MARK: - Attributes
    let id: String
    let name: String
    let artist: String
    let image: String
    let releaseDate: String
    let genre: Genre
    let copyright: String
    let url: String
    
    
    // MARK: - Decodable Enum
    private enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case image = "artworkUrl100"
        case genre = "genres"
        case id, name, releaseDate, copyright, url
    }
}
