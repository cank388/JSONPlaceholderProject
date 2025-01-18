//
//  UserListDetailViewModel.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

protocol UserListDetailViewModelProtocol {
    var user: User { get }
}

final class UserListDetailViewModel: UserListDetailViewModelProtocol {
    let user: User
    
    init(user: User) {
        self.user = user
    }
}
