//
//  UserListModel.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

// MARK: - UserModel Single Element
struct User: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: GeoLocation?
}

// MARK: - Geo
struct GeoLocation: Codable {
    let latitude, longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case latitude  = "lat"
        case longitude = "lng"
        
    }
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase: String?
    let businessStrategy: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case businessStrategy = "bs" // Converting bs to readable format
    }
    
}

// MARK: - We will parse as array of UserModelElement
typealias UserModel = [User]
