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

    func stopActivityIndicator() {
        activityIndicator?.stopAnimating()
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GenreCollectionViewCell,
            let genre = cell.genre else { return }
        
        // Hide cells
        guard let cells = albumsTableView?.visibleCells else { return }
        for cell in cells {
            cell.alpha = 0
        }
        
        view.layoutIfNeeded()

        activityIndicator?.startAnimating()
        viewModel.loadAlbums(genre: genre, albumCount: 100)
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


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard cell.alpha == 0 else { return }
        UIView.animate(withDuration: 0.25, delay: 0.25 * Double(indexPath.row), animations: {
            cell.alpha = 1
        })
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if viewModel.showAlternativeDesign ?? false {

            // Config. VC
            let detailAlternativeViewController = DetailAlternativeAlbumViewController()
            detailAlternativeViewController.viewModel = viewModel
            detailAlternativeViewController.albumIndex = indexPath.row

            // Push View Controller
            navigationController?.pushViewController(detailAlternativeViewController, animated: true)
            return
        }

        // Config.
        let detailViewController = DetailAlbumViewController()
        detailViewController.viewModel = viewModel
        detailViewController.albumIndex = indexPath.row

        // Push
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
