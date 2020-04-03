//
//  GenreCollectionViewCell.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    // MARK: - Views
    var label: UILabel!
    var lip: UIView!

    
    // MARK: - Properties
    static let identifier = String(describing: GenreCollectionViewCell.self)
    var genre: AlbumGenre? {
        didSet {
            label.text = genre?.rawValue.uppercased()
        }
    }
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else { return }
                self.lip.alpha = self.isSelected ? 1 : 0.2
            }
        }
    }


    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    // MARK: - Prepare UI
    private func prepareUI() {
        // Label
        label = NLabel(title: "Genre", font: .NTitleBold, textColor: .NBlack)
        label.centerIn(superview: self)

        // Bottom Lip
        lip = UIView()
        lip.alpha = 0.2
        lip.backgroundColor = .NBlack

        self.addSubview(lip)
        lip.setSize(height: 5)
        lip.setConstraint(bottomAnchor: bottomAnchor,
                          leadingAnchor: leadingAnchor,
                          trailingAnchor: trailingAnchor)
    }
}
