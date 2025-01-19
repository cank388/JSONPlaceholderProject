//
//  UserListDetailViewModel.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

protocol UserListDetailViewModelProtocol {
    var username: String { get }
    var name: String { get }
    var email: String { get }
    var company: String { get }
    var website: URL { get }
}

final class UserListDetailViewModel: UserListDetailViewModelProtocol {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var username: String {
        return user.username ?? ""
    }
    
    var name: String {
        return user.name ?? ""
    }
        
    var email: String {
        return user.email ?? ""
    }
    
    var company: String {
        return user.company?.name ?? ""
    }
    
    var website: URL {
        return URL(string: "https://\(user.website ?? "")")!
    }
    
}
