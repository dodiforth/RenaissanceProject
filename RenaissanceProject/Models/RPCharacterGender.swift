//
//  RPCharacterGender.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import Foundation

enum RPCharacterGender: String, Codable {
    //'Female', 'Male', 'Genderless', 'unknown'
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
