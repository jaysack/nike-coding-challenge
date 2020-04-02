//
//  HomeViewController.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let network = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        network.fetchAlbums(albumType: .country, albumCount: 100) { (result) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

