//
//  UserDetailViewController.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit

class UserDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var id: Int?
    var userName: String?
    var viewModel = UserDetailViewModel()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .systemBlue
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureViewModel()
        
        if let id = id {
            self.title = userName!
            indicator.startAnimating()
            viewModel.loadUser(for: id)
        }
    }

    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: "UserDetailTableViewCell")
    }
    
    func configureViewModel() {
        viewModel.success = { [weak self] in
            self?.updateUI()
        }
        
        viewModel.reloadData = { [weak self] in
            self?.updateUI()
        }
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.indicator.stopAnimating()
            self.indicator.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userdetail != nil ? 1 : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell", for: indexPath) as! UserDetailTableViewCell
        if let user = viewModel.userdetail {
            cell.configure(with: user)
        }
        return cell
    }
}
