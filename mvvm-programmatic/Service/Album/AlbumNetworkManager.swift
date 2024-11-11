//
//  AlbumNetworkManager.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import Foundation

class AlbumNetworkManager: NetworkManager {
    let manager = NetworkManager()
    
    func getAlbumItems(completion: @escaping ([AlbumStruct]?, String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .albums)
        manager.request(model: [AlbumStruct].self, url: url) {data, error in
            completion(data,error)}
    }
}
