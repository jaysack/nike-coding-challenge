//
//  DetailViewController+UI.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

extension DetailAlbumViewController {
    
    // MARK: - Set Status Bar
    func setStatusBar() {
        UIApplication.shared.statusBarStyle = .darkContent
    }
    

    // MARK: - Config. Screen
    func configScreen() {

        view.backgroundColor = .NWhite

        // Config.
        mainStackView = UIStackView()
        mainStackView?.axis = .vertical
        mainStackView?.alignment = .fill
        mainStackView?.distribution = .fill
        mainStackView?.spacing = padding

        // Add to superview
        guard let mainStackView = mainStackView else { return }
        view.addSubview(mainStackView)
        mainStackView.setConstraint(topAnchor: view.topAnchor,
                                    bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                                    bottomConstant: buttonHeight + (padding * 2),
                                    leadingAnchor: view.leadingAnchor,
                                    trailingAnchor: view.trailingAnchor)
    }


    // MARK: - Image
    func prepareBackgroundImage() {
        // Config.
        backgroundImageView = UIImageView()
        backgroundImageView?.clipsToBounds = true
        backgroundImageView?.contentMode = .scaleAspectFill
        backgroundImageView?.setContentCompressionResistancePriority(.init(rawValue: 200), for: .vertical)
        
        // Add to view
        guard let backgroundImageView = backgroundImageView else { return }
        mainStackView?.addArrangedSubview(backgroundImageView)
    }
    
    


    // MARK: - UI Elements
    func setupUI() {
        
        let album = viewModel?.albums[albumIndex]

        // Padding View
        let paddingView = UIView()
        paddingView.backgroundColor = .red
        paddingView.setContentHuggingPriority(.init(rawValue: 100), for: .vertical)
        paddingView.setContentCompressionResistancePriority(.init(rawValue: 100), for: .vertical)
        mainStackView?.addArrangedSubview(paddingView)

        // Labels
        let artistNameLabel = NLabel(title: album?.artist, font: .NSubtitle, textColor: .NBlack)
        artistNameLabel.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        let albumTitleLabel = NLabel(title: album?.name.uppercased(), font: .NTitleLarge, textColor: .NBlack)
        albumTitleLabel.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        let copyrightLabel = NLabel(title: album?.copyright, font: .systemFont(ofSize: 14), textColor: .NGray)
        copyrightLabel.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        
        // Label Stack View
        let labelStackView = UIStackView(arrangedSubviews: [artistNameLabel, albumTitleLabel])
        labelStackView.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)

        // Release Date string formatting
        let releaseDate = dateFormatter.date(from: album?.releaseDate ?? "")
        dateFormatter.dateFormat = "MMM d, yyyy"

        var releaseDateLabel = NLabel()
        if let date = releaseDate {
            releaseDateLabel = NLabel(title: "Release Date: " + dateFormatter.string(from: date),
                                      font: .systemFont(ofSize: 14),
                                      textColor: .NGray)
        }

        labelStackView.addArrangedSubview(releaseDateLabel)
        labelStackView.addArrangedSubview(copyrightLabel)

        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill
        labelStackView.spacing = padding / 2

        // Add margins by using levelUpStackView
        let leftPaddingView = UIView()
        leftPaddingView.setSize(width: padding)

        let rightPaddingView = UIView()
        rightPaddingView.setSize(width: padding)

        let labelMainStackView = UIStackView(arrangedSubviews: [leftPaddingView, labelStackView, rightPaddingView])
        labelMainStackView.axis = .horizontal
        labelMainStackView.alignment = .fill
        labelMainStackView.distribution = .fill
        labelMainStackView.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        
        // Button
        button = UIButton()
        button?.setTitle("Open in iTunes", for: .normal)
        button?.setTitleColor(.NWhite, for: .normal)
        button?.backgroundColor = .NBlack
        button?.layer.cornerRadius = buttonHeight / 2
        button?.setSize(width: view.bounds.width - (padding * 2), height: buttonHeight)
        
        // Add constraints
        guard let button = button else { return }
        view.addSubview(button)
//        view.addSubview(labelStackView)
        button.setConstraint(bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                             bottomConstant: padding,
                             centerXAnchor: view.centerXAnchor)
        
        mainStackView?.addArrangedSubview(labelMainStackView)
//        labelStackView.setConstraint(bottomAnchor: button.topAnchor,
//                                     bottomConstant: padding,
//                                     leadingAnchor: button.leadingAnchor,
//                                     trailingAnchor: button.trailingAnchor)
    }
}
