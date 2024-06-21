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
    
    /// API Call
    /// - Parameters:
    ///   - request: RPRequest
    ///   - completion: Callback with data or error from API call
    public func execute(_ request: RPRequest, completion: @escaping (Result<Data, Error>) -> Void) {
//        let task = URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data, error == nil else {
//                completion(.failure(RPRequest.failedToGetData))
//                return
//            }
//            completion(.success(data))
//        }
//        task.resume()
    }
}
