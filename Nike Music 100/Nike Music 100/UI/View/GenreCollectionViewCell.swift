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
    var label: UILabel?
    var lip: UIView?

    
    // MARK: - Properties
    static let identifier = String(describing: GenreCollectionViewCell.self)
    var genre: AlbumGenre? {
        didSet {
            label?.text = genre?.rawValue.capitalized
        }
    }
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.25) { [weak self] in
    
                guard let self = self else { return }
                
                self.label?.font = self.isSelected ? .systemFont(ofSize: 16, weight: .semibold) : .systemFont(ofSize: 16, weight: .medium)
                self.label?.textColor = self.isSelected ? .NBlack : .NGray
            }
        }
    }


    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    // MARK: - Prepare UI
    private func setupLabel() {
        // Label
        label = NLabel(title: "Genre", font: .systemFont(ofSize: 16, weight: .medium), textColor: .NSilver)
        label?.centerIn(superview: self)
    }

    public func addSeparatorLine() {

        let separatorLine = UIView()
        separatorLine.backgroundColor = .NGray

        addSubview(separatorLine)
        separatorLine.setSize(width: 1)
        separatorLine.setConstraint(topAnchor: topAnchor,
                                    topConstant: 14,
                                    bottomAnchor: bottomAnchor,
                                    bottomConstant: 14,
                                    trailingAnchor: trailingAnchor)
    }
}
