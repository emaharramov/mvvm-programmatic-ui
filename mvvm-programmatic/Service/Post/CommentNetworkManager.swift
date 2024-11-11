//
//  CommentNetworkManager.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import Foundation

class CommentNetworkManager {
    let manager = NetworkManager()
    
    func getCommentById(id: Int, completion: @escaping ([CommentStruct]?, String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .comments(postId: id))
        manager.request(model: [CommentStruct].self, url: url) {data, error in
            completion(data,error)}
    }
}
