//
//  UserListTableViewModel.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

final class UserListTableViewModel {
    private let user: User
    
    var username: String {
        return user.username ?? ""
    }
    
    var name: String {
        return user.name ?? ""
    }
    
    var email: String {
        return user.email ?? ""
    }
    
    init(user: User) {
        self.user = user
    }
}
