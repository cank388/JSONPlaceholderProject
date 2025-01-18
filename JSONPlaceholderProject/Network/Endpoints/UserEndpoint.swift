//
//  UserEndpoint.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

enum UserEndpoint: Endpoint {
    case getUsers
    case getUser(id: Int)
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getUser(let id):
            return "/users/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        return nil
    }
}
