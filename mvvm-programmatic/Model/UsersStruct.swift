//
//  UsersStruct.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 25.10.24.
//

import Foundation

struct UsersStruct: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let phone: String?
    let website: String?
    let company: Company?
    let address: Address?
}

struct Company: Codable {
    let name: String?
    let catchPhrase: String?
    let bs: String?
}

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat: String?
    let lng: String?
}
