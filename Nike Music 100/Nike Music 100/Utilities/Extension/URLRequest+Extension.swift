//
//  URLRequest+Extension.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import Foundation

extension URLRequest {

    init?(for albumType: AlbumGenre, albumCount: Int) {
        
        // Check endpoint
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/\(albumType.rawValue)/\(albumCount)/explicit.json"
        guard let url = URL(string: urlString) else {
            print("🌐 - Network call cancelled: Endpoint not valid ❌")
            return nil
        }

        // Call initializer
        self.init(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)

        // Add HTTP Method
        self.httpMethod = "GET"
    }
}
