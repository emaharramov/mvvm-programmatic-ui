//
//  UserVM.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import Foundation

class UsersViewModel {
    var users: [UsersStruct] = []
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var reloadData: (() -> Void)?
    
    let manager = UserNetworkManager()
    
    func loadUsers() {
        manager.getAllUsers { users,errorString in
            if let errorString {
                self.error?(errorString)
            } else if let users {
                self.users = users
                self.success?()
            }
        }
    }
}
