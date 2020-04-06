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
    func stopActivityIndicator()
}

class ViewModel {

    // MARK: - Variables
    var albums = [Album]()
    var showAlternativeDesign: Bool?
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
                self?.delegate?.stopActivityIndicator()

            case .failure(let error):
                print("Unable to fetch albums ~> \(error.localizedDescription)")
            }
        }
    }


    // MARK: - Load Image
    func loadImage(albumIndex: Int, largeFormat: Bool = false, completion: @escaping (UIImage?) -> Void) {

        let imageUrl = albums[albumIndex].image
        guard let url = largeFormat ? getLargeImageUrlString(from: imageUrl) : imageUrl else { return }

        // Try from cache first
        cache.retrieve(imageUrl: url) { [weak self] (image) in
            if let image = image {
                completion(image)
                return
            }

            // Fetch from network
            guard let self = self else { return }
            self.network.fetchAlbumCover(imageUrl: url) { (image) in
                completion(image)
            }
        }
    }

    
    // MARK: - Get Large Image URL
    private func getLargeImageUrlString(from imageUrl: String) -> String? {

        let largeImageFormat = "804x0w.jpg"

        if let range = imageUrl.range(of: ".jpg/") {

            let largeImageUrlString = imageUrl[...range.lowerBound]
            return largeImageUrlString + "jpg/" + largeImageFormat
        }

        return nil
    }
}
