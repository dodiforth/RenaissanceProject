//
//  RPCharacter.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import Foundation

struct RMCharacter: Codable {
    
        let id: Int
        let name: String
        let status: RPChararacterStatus
        let species: String
        let type: String
        let gender: RPCharacterGender
        let origin: RPOrigin
        let location: RPSingleLocation
        let image: String
        let episode: [String]
        let url: String
        let created: String
    
}

