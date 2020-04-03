//
//  PromptViewController.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/3/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class PromptViewController: UIViewController {
    
    // MARK: - ViewModel
    var viewModel: ViewModel?


    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    
    func setupScreen() {

        // Background
        view.backgroundColor = UIColor.NBlack?.withAlphaComponent(0.3)

        // Labels
        let header = NLabel(title: "RSS Feed Generator Incomplete", font: .systemFont(ofSize: 20, weight: .bold), textColor: .black)
        let subheader = NLabel(title: "It looks like Apple's RSS ", font: <#T##UIFont?#>, textColor: <#T##UIColor?#>, allowMultiline: <#T##Bool#>)
    }
    
    
    // MARK: - Button Action
    @objc func openItunesApp() {

    }

}
