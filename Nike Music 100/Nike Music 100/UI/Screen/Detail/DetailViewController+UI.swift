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
    func prepareBackgroundImage() {
        // Config.
        view.backgroundColor = .NWhite
        backgroundImageView = UIImageView()
        backgroundImageView?.backgroundColor = .NWhite
        backgroundImageView?.contentMode = .scaleAspectFill
        
        // Add to view
        backgroundImageView?.pinTo(superview: view)
        
        // Add tint
        let tintView = UIView()
        tintView.backgroundColor = .black
        tintView.alpha = 0.4 
        
        tintView.pinTo(superview: view)
    }
    
    
    // MARK: - UI Elements
    func setupUI() {
        
        let album = viewModel?.albums[albumIndex]

        // Labels
        let artistNameLabel = NLabel(title: album?.artist, font: .NSubtitle, textColor: .NWhite)
        let albumTitleLabel = NLabel(title: album?.name.uppercased(), font: .NTitleLarge, textColor: .NWhite)
        let copyrightLabel = NLabel(title: album?.copyright, font: .systemFont(ofSize: 14), textColor: .NWhite)
        
        // Label Stack View
        let labelStackView = UIStackView(arrangedSubviews: [artistNameLabel, albumTitleLabel])

        // Release Date string formatting
        let releaseDate = dateFormatter.date(from: album?.releaseDate ?? "")
        dateFormatter.dateFormat = "MMM d, yyyy"

        var releaseDateLabel = NLabel()
        if let date = releaseDate {
            releaseDateLabel = NLabel(title: "Release Date: " + dateFormatter.string(from: date),
                                      font: .systemFont(ofSize: 14),
                                      textColor: .NWhite)
        }

        labelStackView.addArrangedSubview(releaseDateLabel)
        labelStackView.addArrangedSubview(copyrightLabel)

        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill
        labelStackView.spacing = padding / 2
        
        // Button
        let buttonHeight: CGFloat = 50
        button = UIButton()
        button?.setTitle("Open in iTunes", for: .normal)
        button?.setTitleColor(.NBlack, for: .normal)
        button?.backgroundColor = .NWhite
        button?.layer.cornerRadius = buttonHeight / 2
        button?.setSize(width: view.bounds.width - (padding * 2), height: buttonHeight)
        
        // Add constraints
        guard let button = button else { return }
        view.addSubview(button)
        view.addSubview(labelStackView)
        button.setConstraint(bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                             bottomConstant: padding,
                             centerXAnchor: view.centerXAnchor)
        labelStackView.setConstraint(bottomAnchor: button.topAnchor,
                                     bottomConstant: padding,
                                     leadingAnchor: button.leadingAnchor,
                                     trailingAnchor: button.trailingAnchor)
    }
}
