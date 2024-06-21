//
//  RPEpisode.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import Foundation

struct RPEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
