//
//  UserRepository.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void)
}

final class UserRepository: UserRepositoryProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        networkManager.request(UserEndpoint.getUsers, completion: completion)
    }
}
