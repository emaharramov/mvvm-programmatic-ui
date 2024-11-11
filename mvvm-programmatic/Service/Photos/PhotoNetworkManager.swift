//
//  PhotoNetworkManager.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import Foundation

class PhotoNetworkManager {
    let manager = NetworkManager()
    
    func getPhotoItems(completion: @escaping ([PhotosStruct]?, String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .photos)
        manager.request(model: [PhotosStruct].self,
                        url: url) { data, error in
            completion(data, error)
        }
    }

    func getPhotoById(id: Int, completion: @escaping (PhotosStruct?, String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .photodetail(id: id))
        manager.request(model: PhotosStruct.self, url: url) { data, error in
            completion(data, error)
        }
    }
}
