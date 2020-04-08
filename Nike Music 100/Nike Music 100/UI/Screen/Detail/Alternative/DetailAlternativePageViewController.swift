//
//  DetailAlternativePageViewController.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/6/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class DetailAlternativePageViewController: UIPageViewController {

    // MARK: - Property
    var viewModel: ViewModel?
    var currentAlbumIndex: Int = 0


    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
    }
}

extension DetailAlternativePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let previousVC = viewController as? DetailAlternativeAlbumViewController, (previousVC.albumIndex - 1) >= 0 else { return nil }

        let detailAlternativeViewController = DetailAlternativeAlbumViewController()
        detailAlternativeViewController.viewModel = viewModel
        detailAlternativeViewController.albumIndex = previousVC.albumIndex - 1

        return detailAlternativeViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let nextVC = viewController as? DetailAlternativeAlbumViewController,
            let albumCount = viewModel?.albums.count,
            nextVC.albumIndex < (albumCount - 1) else { return nil }

        let detailAlternativeViewController = DetailAlternativeAlbumViewController()
        detailAlternativeViewController.viewModel = viewModel
        detailAlternativeViewController.albumIndex = nextVC.albumIndex + 1

        return detailAlternativeViewController
    }
}
