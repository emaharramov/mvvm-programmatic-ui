//
//  UserDetailTableViewCell.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(companyLabel)
        contentView.addSubview(addressLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            phoneLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            companyLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8),
            companyLabel.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: phoneLabel.trailingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 8),
            addressLabel.leadingAnchor.constraint(equalTo: companyLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: companyLabel.trailingAnchor),
            addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)

        ])
    }

    func configure(with model: UsersStruct) {
        nameLabel.text = model.name
        emailLabel.text = model.email
        phoneLabel.text = model.phone
        if let company = model.company {
            companyLabel.text = company.name
        }
        if let address = model.address {
            addressLabel.text = (address.street ?? "") + ", " + (address.city ?? "") + ", " + (address.zipcode ?? "")
        }
    }
}
