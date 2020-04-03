//
//  HomeViewController+UI.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

extension HomeViewController {

    // MARK: - Screen Config.
    func configScreen() {

        // General
        view.backgroundColor = .NWhite

        // Stack View
        mainStackView = UIStackView()
        mainStackView?.axis = .vertical
        mainStackView?.alignment = .fill
        mainStackView?.distribution = .fill

        // Add constraints
        guard let mainStackView = mainStackView else { return }
        view.addSubview(mainStackView)
        mainStackView.setConstraint(topAnchor: view.safeAreaLayoutGuide.topAnchor,
                                    bottomAnchor: view.bottomAnchor,
                                    leadingAnchor: view.leadingAnchor,
                                    trailingAnchor: view.trailingAnchor)
    }


    // MARK: - Activity Indicator
    func prepareActivityIndicator() {
        // Config.
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.tintColor = .black
        activityIndicator?.hidesWhenStopped = true

        // Constraints
        guard let activityIndicator = activityIndicator else { return }
        view.addSubview(activityIndicator)
        activityIndicator.centerIn(superview: view)
    }


    // MARK: - Curtain View
    func prepareCurtainView() {
        // Config.
        curtainView = UIImageView(image: UIImage(named: "nike-image"))
        curtainView?.contentMode = .scaleAspectFit
        curtainView?.backgroundColor = .NFakeWhite
        curtainView?.layer.zPosition = 1
    
        // Required constraints
        guard let curtainView = curtainView else { return }
        view.addSubview(curtainView)
        curtainView.setConstraint(topAnchor: view.topAnchor,
                                  topConstant: UIApplication.shared.statusBarFrame.size.height ?? 0,
                                  bottomAnchor: view.bottomAnchor,
                                  leadingAnchor: view.leadingAnchor,
                                  trailingAnchor: view.trailingAnchor)
    }


    // MARK: - Category CollectionView
    func setupGenresCollectionView() {

        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        // Config.
        let genresCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        genresCollectionView.dataSource = self
        genresCollectionView.delegate = self
        genresCollectionView.backgroundColor = .clear
        genresCollectionView.showsHorizontalScrollIndicator = false
        genresCollectionView.contentInsetAdjustmentBehavior = .never

        // Select default section (Home)
        genresCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)

        // Register custom cell
        genresCollectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)

        // Constraints
        genresCollectionView.setSize(height: 50)

        // Add to content stack view
        mainStackView?.addArrangedSubview(genresCollectionView)
    }

    // MARK: - Album TableView
    func setupAlbumTableViewCell() {

        // Config.
        albumsTableView = UITableView()
        albumsTableView?.dataSource = self
        albumsTableView?.delegate = self
        albumsTableView?.backgroundColor = .clear
        albumsTableView?.separatorStyle = .none
        albumsTableView?.contentInsetAdjustmentBehavior = .never

        // Register custom cell
        albumsTableView?.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)

        // Add to content Stack View
        guard let albumsTableView = albumsTableView else { return }
        mainStackView?.addArrangedSubview(albumsTableView)
    }
}
