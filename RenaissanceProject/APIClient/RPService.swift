//
//  RPService.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import Foundation

/// Primary API Service object to get Rick and Morty data
final class RPService {
    
    /// Shared singleton instance
    static let shared = RPService()
    
    /// Privatized constructor
    private init() {}
    
    enum RPServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    
    /// API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type : The type of object we expect to get back
    ///   - completion: Callback with data or error from API call
    public func execute<T:Codable>(_ request: RPRequest,expecting tyep:T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RPServiceError.failedToCreateRequest))
            return }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RPServiceError.failedToGetData))
                return
            }
            
            // Decode response
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from rpRequest: RPRequest) -> URLRequest? {
        guard let url = rpRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rpRequest.httpMethod
        return request
    }
}
