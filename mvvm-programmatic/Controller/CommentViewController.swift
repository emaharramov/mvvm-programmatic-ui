//
//  CommentViewController.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var id: Int?
    var viewModel = CommentsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = id {
            viewModel.loadComments(for: id)
            self.title = "Comments"
        }
        
        setupUI()
        configureViewModel()
    }

    func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: "CommentsTableViewCell")
    }
    
    func configureViewModel() {
        
        viewModel.success = {
            self.tableView.reloadData()
        }

    }
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as? CommentsTableViewCell else {
            fatalError("The dequeued cell is not an instance of CommentsTableViewCell.")
        }
        let comment = viewModel.comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
}
