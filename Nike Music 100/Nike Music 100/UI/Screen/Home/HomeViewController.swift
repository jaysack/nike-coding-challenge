//
//  HomeViewController.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Propertyes
    let network = NetworkManager.shared
    let viewModel = ViewModel()

    // MARK: - Views
    var mainStackView: UIStackView?
    var curtainView: UIImageView?
    var albumsTableView: UITableView?
    var activityIndicator: UIActivityIndicatorView?


    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // ViewModel
        viewModel.delegate = self
        viewModel.loadAlbums(genre: .all, albumCount: 100)

        // Container
        configScreen()

        // Subviews
        prepareActivityIndicator()
        prepareCurtainView()
        setupGenresCollectionView()
        setupAlbumTableViewCell()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fadeOutLogo()
    }


    // MARK: - Animate Curtain
    private func fadeOutLogo() {

        UIView.animate(withDuration: 0.5, delay: 1.5, options: [], animations: { [weak self] in
            guard let self = self else { return }
            self.curtainView?.alpha = 0
            self.view.layoutIfNeeded()
        })
    }
}

