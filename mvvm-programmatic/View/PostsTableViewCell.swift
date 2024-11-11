//
//  PostsTableViewCell.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GoodlyRegular", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brown
        return label
    }()

    
    let descriptionField: UITextView = {
        let field = UITextView()
        field.font = UIFont(name: "GoodlyRegular", size: 17)
        field.isEditable = false
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionField)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        let minimumHeight: CGFloat = 50
        descriptionField.heightAnchor.constraint(greaterThanOrEqualToConstant: minimumHeight).isActive = true

    }

    func configure(with model: PostStruct) {
        titleLabel.text = model.title
        descriptionField.text = model.body
    }
}
