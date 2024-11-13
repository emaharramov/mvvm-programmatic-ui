//
//  UsersViewController.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let userViewModel = UsersViewModel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureViewModel()
        self.title = "Users"
    }
    
    func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: "UsersTableViewCell")
    }
    
    func configureViewModel() {
        userViewModel.loadUsers()
        
        
        userViewModel.success = {
            self.tableView.reloadData()
        }
        
        userViewModel.reloadData = {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
        let users = userViewModel.users[indexPath.row]
        cell.configure(with: users)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userId = userViewModel.users[indexPath.row].id
        let userName = userViewModel.users[indexPath.row].name
        if let controller = storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController {
            controller.id = userId
            controller.userName = userName
            if let navigationController = navigationController {
                navigationController.show(controller, sender: nil)
            } else {
                print("NavigationController is nil")
            }
        } else {
            print("Failed to instantiate CommentController with identifier 'CommentController'")
        }
    }

}
