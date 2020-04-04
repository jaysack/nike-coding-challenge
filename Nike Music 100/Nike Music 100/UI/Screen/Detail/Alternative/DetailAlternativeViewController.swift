//
//  DetailAlternativeViewController.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/3/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class DetailAlternativeAlbumViewController: UIViewController {
    
    // MARK: - Constants
    let padding: CGFloat = 20
    
    
    // MARK: - Property
    var viewModel: ViewModel?
    var albumIndex: Int = 0
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    
    // MARK: - Views
    var backgroundImageView: UIImageView?
    var button: UIButton?
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // UI
        setStatusBar()
        prepareBackgroundImage()
        setupUI()
        loadBackgroundImage()
        
        // Action
        enableButton()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }


    // MARK: - Load Image
    func loadBackgroundImage() {
        viewModel?.loadImage(albumIndex: albumIndex, largeFormat: true, completion: { [weak self] (image) in
            self?.backgroundImageView?.image = image
            self?.view.layoutIfNeeded()
        })
    }
    
    
    // MARK: - Button Action
    func enableButton() {
        button?.addTarget(self, action: #selector(openItunesApp), for: .touchUpInside)
    }
    
    
    @objc func openItunesApp() {
        
        guard let albumId = viewModel?.albums[albumIndex].id else {
            print("Unable to get Album ID")
            return
        }

        if let url = URL(string: "https://itunes.apple.com/us/album/id\(albumId)")
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)

            } else {
                
                if UIApplication.shared.canOpenURL(url as URL) {
                    UIApplication.shared.openURL(url as URL)

                } else {
                    showAlert()
                }
            }
        }
    }

    
    // MARK: - Alert
    func showAlert() {
        // Config. Alert
        let alertController = UIAlertController(title: "Cannot Connect to iTunes Store", message: "Please try again", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        // Present Alert
        present(alertController, animated: true)
    }
}
