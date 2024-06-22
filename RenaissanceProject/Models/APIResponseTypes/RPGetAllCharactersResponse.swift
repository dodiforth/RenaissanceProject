//
//  RPGetAllCharactersResponse.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 22/06/2024.
//

import Foundation

struct RPGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RPCharacter]
}
    

