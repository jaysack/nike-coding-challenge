//
//  NetworkManager.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import Foundation

final class NetworkManager {
    
    // MARK: - Singleton Stack
    static let shared = NetworkManager()
    private init() {}


    // MARK: - Fetch Albums
    func fetchAlbums(albumType: AlbumGenre, albumCount: Int, completion: @escaping (Result<FeedResponse, Error>) -> Void) {
        
        // Create request
        guard let request = URLRequest(for: albumType, albumCount: albumCount) else { return }
        
        // Start URL Session
        URLSession.shared.dataTask(with: request, completionHandler: { (data, result, error) in
            
            // Handle error (if any)
            if let error = error {
                completion(.failure(error))
                return
            }

            // Unwrap data
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(FeedResponse.self, from: data)
                DispatchQueue.main.sync {
                    completion(.success(response))
                    return
                }
            } catch {
                print("⚠️ - Unable to decode \(FeedResponse.self) data ~> \(error.localizedDescription)")
                return
            }
        }).resume()
    }
}
