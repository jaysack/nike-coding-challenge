//
//  HomeViewController+Protocols.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

// MARK: - ViewModel Protocol
extension HomeViewController: ViewModelDelegate {
    func refreshAlbums() {
        albumsTableView?.separatorStyle = .singleLine
        albumsTableView?.reloadData()
    }
}


// MARK: - CollectionView Protocol
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumGenre.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // Dequeue cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else { return UICollectionViewCell() }
        
        // Config. cell
        cell.genre = AlbumGenre.allCases[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.bounds.width / CGFloat(AlbumGenre.allCases.count)
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}


// MARK: - TableView Protocol
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as? AlbumTableViewCell else { return UITableViewCell() }

        // Prevent cell image mix-up
        defer {
            viewModel.loadImage(albumIndex: indexPath.row) { [weak self] (image) in
                if cell.ranking == (indexPath.row + 1) {
                    cell.albumImageView?.image = image
                }
            }
        }

        cell.album = viewModel.albums[indexPath.row]
        cell.ranking = indexPath.row + 1

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
