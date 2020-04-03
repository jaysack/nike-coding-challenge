//
//  ViewModel.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

protocol ViewModelDelegate: AnyObject {
    func refreshAlbums()
}

class ViewModel {

    // MARK: - Variables
    var albums = [Album]()
    weak var delegate: ViewModelDelegate?

    
    // MARK: - Services
    let network = NetworkManager.shared
    let cache = CacheManager.shared


    // MARK: - Fetch Albums
    func loadAlbums(genre: AlbumGenre, albumCount: Int) {

        network.fetchAlbums(albumType: genre, albumCount: albumCount) { [weak self] (result) in
            
            switch result {
            case .success(let response):
                self?.albums = response.feed.results
                self?.delegate?.refreshAlbums()

            case .failure(let error):
                print("Unable to fetch albums ~> \(error.localizedDescription)")
            }
        }
    }


    // MARK: - Load Image
    func loadImage(albumIndex: Int, completion: @escaping (UIImage?) -> Void) {

        // Try from cache first
        cache.retrieve(imageUrl: albums[albumIndex].image) { [weak self] (image) in
            if let image = image {
                completion(image)
                return
            }

            // Fetch from network
            guard let self = self else { return }
            self.network.fetchAlbumCover(imageUrl: self.albums[albumIndex].image) { (image) in
                completion(image)
            }
        }

        
    }
}
