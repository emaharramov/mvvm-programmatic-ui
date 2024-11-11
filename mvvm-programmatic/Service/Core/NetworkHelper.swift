//
//  NetworkHelper.swift
//  mvvm-programmatic
//
//  Created by Emil Maharramov on 11.11.24.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()

    private let baseURL: String = "https://jsonplaceholder.typicode.com/"

    func url(for endpoint: Endpoint) -> String {
        return baseURL + endpoint.path
    }

    enum Endpoint {
        case posts
        case comments(postId: Int)
        case photos
        case photodetail(id: Int)
        case users
        case albums
        case usersdetail(id: Int)

        var path: String {
            switch self {
            case .posts:
                return "posts"
            case .comments(let postId):
                return "comments?postId=\(postId)"
            case .photos:
                return "photos"
            case .photodetail(let id):
                return "photos/\(id)"
            case .users:
                return "users"
            case .usersdetail(let id):
                return "users/\(id)"
            case .albums:
                return "albums"
            }
        }
    }
}
