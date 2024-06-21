//
//  RPRequest.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import Foundation


/// Object that represents a single API call
final class RPRequest {
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    /// Desired Endpoint
    private let endpoint: RPEndpoint
    
    /// Path Components for API, if any
    private let pathComponents:Set<String>
    
    /// Query arguments for API, if any
    private let queryParameters:[URLQueryItem]
    
    /// Constructed url for the api request
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            //name=valeu&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }

    /// Computed & Constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    
    // MARK: -  Public
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: collection of Path components
    ///   - queryParameters: collection of query parameters
    init(
        endpoint: RPEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
