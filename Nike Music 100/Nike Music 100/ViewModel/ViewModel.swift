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
        network.fetchAlbumCover(imageUrl: albums[albumIndex].image) { (image) in
            completion(image)
        }
    }
}
