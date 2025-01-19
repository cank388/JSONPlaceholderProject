//
//  JSONPlaceholderProjectTests.swift
//  JSONPlaceholderProjectTests
//
//  Created by Can Kalender on 18.01.2025.
//

import XCTest
@testable import JSONPlaceholderProject

// MARK: - Mock NetworkManager
class MockNetworkManager: NetworkManagerProtocol {
    var shouldSucceed = true
    var mockData: Data?
    
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if shouldSucceed, let mockData = mockData {
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: mockData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        } else {
            completion(.failure(.requestFailed(nil)))
        }
    }
}

final class UserRepositoryTests: XCTestCase {
    var mockNetworkManager: MockNetworkManager!
    var userRepository: UserRepository!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        userRepository = UserRepository(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        mockNetworkManager = nil
        userRepository = nil
        super.tearDown()
    }
    
    func testFetchUsersSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch users successfully")
        let mockUser = User(id: 123, name: "Test User", username: "testuser", email: "test@test.com",
                          address: nil, phone: nil, website: nil, company: nil)
        let mockUsers = [mockUser]
        mockNetworkManager.mockData = try? JSONEncoder().encode(mockUsers)
        mockNetworkManager.shouldSucceed = true
        
        // When
        userRepository.fetchUsers { result in
            // Then
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 1)
                XCTAssertEqual(users.first?.name, "Test User")
                XCTAssertEqual(users.first?.email, "test@test.com")
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchUsersFailure() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch users failure")
        mockNetworkManager.shouldSucceed = false
        
        // When
        userRepository.fetchUsers { result in
            // Then
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error, .requestFailed(nil))
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
