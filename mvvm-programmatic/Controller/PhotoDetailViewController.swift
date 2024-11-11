//
//  PhotoDetailViewController.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit
import Kingfisher

class PhotoDetailController: UIViewController {
    
    var id: Int?
    var photoName: String?
    
    let photoDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .green
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var viewModel = PhotoDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = photoName
        
        setupViews()
        setupConstraints()
        
        if let id = id {
            indicator.startAnimating()
            viewModel.loadPhoto(for: id)
            viewModel.reloadData = { [weak self] in
                self?.loadImage(from: self?.viewModel.photodetail?.thumbnailUrl)
            }
        }
    }
    
    private func setupViews() {
        view.addSubview(photoDetailImageView)
        view.addSubview(indicator)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoDetailImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photoDetailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoDetailImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            photoDetailImageView.heightAnchor.constraint(equalTo: view.widthAnchor),
            
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func loadImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        
        photoDetailImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder")) { [weak self] _ in
            self?.indicator.stopAnimating()
            self?.indicator.isHidden = true
        }
    }
}
