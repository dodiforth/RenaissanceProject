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
    ///   - request: Request instance
    ///   - type : The type of object we expect to get back
    ///   - completion: Callback with data or error from API call
    public func execute<T:Codable>(_ request: RPRequest,expecting tyep:T.Type, completion: @escaping (Result<T, Error>) -> Void) {

    }
}
