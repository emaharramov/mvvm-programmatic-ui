//
//  AlbumsViewController.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import UIKit

class AlbumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let albumViewModel = AlbumsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureViewModel()
        self.title = "Albums"
    }
    
    func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        tableView.register(AlbumsTableViewCell.self, forCellReuseIdentifier: "AlbumsTableViewCell")
    }
    
    func configureViewModel() {
        albumViewModel.loadAlbums()
 
        
        albumViewModel.success = {
            self.tableView.reloadData()
        }
        
        albumViewModel.didUpdateAlbums = {
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
        return albumViewModel.album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumsTableViewCell", for: indexPath) as! AlbumsTableViewCell
        let albums = albumViewModel.album[indexPath.row]
        cell.configure(with: albums)
        return cell
    }
}
