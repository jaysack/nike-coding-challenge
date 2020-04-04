//
//  AlbumTableViewCell.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    // MARK: - Constant
    let padding: CGFloat = 20


    // MARK: - Views
    public var albumImageView: UIImageView?
    var cellStackView: UIStackView?
    var rankingLabel: NLabel?
    var albumTitleLabel: NLabel?
    var artistNameLabel: NLabel?

    
    // MARK: - Properties
    static let identifier = String(describing: AlbumTableViewCell.self)
    var album: Album? {
        didSet {
            albumTitleLabel?.text = album?.name.uppercased()
            artistNameLabel?.text = album?.artist
        }
    }
    var ranking: Int? {
        didSet {
            guard let ranking = ranking else { return }
            rankingLabel?.text = String(ranking)
        }
    }


    // MARK: - Init Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        prepareUI()
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    


    // MARK: - Prepare UI
    private func prepareUI() {
        setupStackView()
        setupRanking()
        prepareAlbumImage()
        prepareAlbumDescription()
        setupArrowIcon()
    }


    // MARK: - Set Stack View
    private func setupStackView() {
        // Config.
        cellStackView = UIStackView()
        cellStackView?.axis = .horizontal
        cellStackView?.alignment = .fill
        cellStackView?.distribution = .fill
        cellStackView?.spacing = padding

        // Constraints
        guard let cellStackView = cellStackView else { return }
        addSubview(cellStackView)
        cellStackView.setConstraint(topAnchor: topAnchor,
                                    topConstant: padding / 2,
                                    bottomAnchor: bottomAnchor,
                                    bottomConstant: padding / 2,
                                    leadingAnchor: leadingAnchor,
                                    leadingConstant: padding,
                                    trailingAnchor: trailingAnchor,
                                    trailingConstant: padding / 2)
    }


    // MARK: - Ranking Label
    private func setupRanking() {
        rankingLabel = NLabel(title: String(1), font: .monospacedSystemFont(ofSize: 14, weight: .bold), textColor: .NBlack)
        
        guard let rankingLabel = rankingLabel else { return }
        rankingLabel.setSize(width: 26)
        

        // Add to Stack View
        cellStackView?.addArrangedSubview(rankingLabel)
    }

    
    // MARK: - Album Image
    private func prepareAlbumImage() {
        // Config.
        albumImageView = UIImageView()
        albumImageView?.backgroundColor = .NSilver
        albumImageView?.contentMode = .scaleAspectFill
        albumImageView?.layer.cornerRadius = 2
        albumImageView?.translatesAutoresizingMaskIntoConstraints = false

        // Constraints
        guard let albumImageView = albumImageView else { return }
        albumImageView.widthAnchor.constraint(equalTo: albumImageView.heightAnchor, multiplier: 1).isActive = true

        // Add to Stack View
        cellStackView?.addArrangedSubview(albumImageView)
    }

    
    // MARK: - Album Title and Artiste
    private func prepareAlbumDescription() {

        // Album Title
        albumTitleLabel = NLabel(title: "Album Title", font: .NTitle, textColor: .NBlack)
        albumTitleLabel?.contentMode = .bottom

        // Album Artist
        artistNameLabel = NLabel(title: "Album Artist", font: .systemFont(ofSize: 14), textColor: .NGray, allowMultiline: false)
        artistNameLabel?.contentMode = .top
        artistNameLabel?.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        
        // Padding Views
        let topPadding = UIView()
        topPadding.setContentHuggingPriority(.init(rawValue: 100), for: .vertical)

        let bottomPadding = UIView()
        bottomPadding.translatesAutoresizingMaskIntoConstraints = false
        bottomPadding.setContentHuggingPriority(.init(rawValue: 100), for: .vertical)

        // Config. Stack View
        guard let albumTitleLabel = albumTitleLabel, let artistNameLabel = artistNameLabel else { return }
        let labelStackView = UIStackView(arrangedSubviews: [topPadding, albumTitleLabel, artistNameLabel, bottomPadding])
        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill
        labelStackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        labelStackView.setContentHuggingPriority(.init(rawValue: 100), for: .horizontal)

        bottomPadding.heightAnchor.constraint(equalTo: topPadding.heightAnchor, multiplier: 1).isActive = true

        // Add to Cell Stack View
        cellStackView?.addArrangedSubview(labelStackView)
    }

    
    // MARK: - Arrow Icon
    func setupArrowIcon() {
        // Config.
        let arrowIcon = UIImage(named: "icon-arrow")
        let arrowIconView = UIImageView(image: arrowIcon)
        arrowIconView.contentMode = .scaleAspectFit
        arrowIconView.setSize(width: 18)
        
        // Add to Cell Stack View
        cellStackView?.addArrangedSubview(arrowIconView)
    }
}
