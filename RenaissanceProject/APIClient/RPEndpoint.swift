//
//  RPEndpoint.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import Foundation


/// Represents a single API endpoint
@frozen enum RPEndpoint: String {
    /// Endpoint for character info
    case character
    /// Endpoint for location info
    case location
    /// Endpoint for episode info
    case episode
}
