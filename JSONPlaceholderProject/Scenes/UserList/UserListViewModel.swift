//
//  UserListViewModel.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

protocol UserListViewModelProtocol {
    var users: [User] { get }
    var onUsersUpdated: (() -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    
    func fetchUsers()
}


final class UserListViewModel: UserListViewModelProtocol {
    
    private let repository: UserRepositoryProtocol
    var users: [User] = []
    var onUsersUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func fetchUsers() {
        repository.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.onUsersUpdated?()
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }

}
