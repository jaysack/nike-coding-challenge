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
    var curtainView: UIView?
    var albumsTableView: UITableView?


    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        // ViewModel
        viewModel.delegate = self
        viewModel.loadAlbums(genre: .all, albumCount: 100)

        // Container
        configScreen()

        // Subviews
        prepareCurtainView()
        setupGenresCollectionView()
        setupAlbumTableViewCell()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateCurtain()
    }


    // MARK: - Animate Curtain
    private func animateCurtain() {

        UIView.animate(withDuration: 0.65, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: { [weak self] in

            guard let self = self else { return }
            self.curtainView?.setConstraint(topAnchor: self.view.bottomAnchor)
            self.view.layoutIfNeeded()
        })
    }
}

