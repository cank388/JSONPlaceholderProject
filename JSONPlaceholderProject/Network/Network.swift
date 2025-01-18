//
//  Network.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import Foundation

// MARK: - NetworkError
enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error?)
    case invalidResponse
    case decodingFailed(Error)
    case invalidStatusCode(Int)
}

// MARK: - HTTPMethod
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// MARK: - Endpoint
protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

// MARK: - NetworkManagerProtocol
protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
}

// MARK: - NetworkManager
final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    private let session: URLSession
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        
        if let parameters = endpoint.parameters {
            if endpoint.method != .get {
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
                } catch {
                    completion(.failure(.requestFailed(error)))
                    return
                }
            }
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidStatusCode(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }
        
        task.resume()
    }
}
