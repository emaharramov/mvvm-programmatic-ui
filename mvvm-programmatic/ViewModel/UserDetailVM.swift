//
//  UserDetailVM.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import Foundation

class UserDetailViewModel {
    var userdetail: UsersStruct?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var reloadData: (() -> Void)?
    
    let manager = UserNetworkManager()
    
    func loadUser(for userId: Int) {
        
        manager.getUser(id: userId) { user, errorString in
            if let errorString {
                self.error?(errorString)
                print(errorString)
            } else if let user {
                self.userdetail = user
                self.reloadData?()
            }
        }
    }
}
