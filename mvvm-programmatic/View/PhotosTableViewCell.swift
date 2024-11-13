//
//  PhotosTableViewCell.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit
import Kingfisher

class PhotosTableViewCell: UITableViewCell {
    
    let imageField: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageField)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageField.widthAnchor.constraint(equalToConstant: 100),
            imageField.heightAnchor.constraint(equalTo: imageField.widthAnchor),
            imageField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: imageField.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with model: PhotosStruct) {
        titleLabel.text = model.title
        loadImage(from: model.thumbnailUrl ?? "")
    }

    private func loadImage(from url: String) {
        guard let imageUrl = URL(string: url) else { return }
        imageField.kf.setImage(with: imageUrl)
    }

}
