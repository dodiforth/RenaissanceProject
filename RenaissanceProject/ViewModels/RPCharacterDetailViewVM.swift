//
//  RPCharacterDetailViewVM.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 23/06/2024.
//

import Foundation

final class RPCharacterDetailViewVM {
    
    public let characterName: String
    public let characterStatus: RPChararacterStatus
    public let characterImageUrl: URL?
    
    // MARK: - Init
    
    init(characterName: String, characterStatus: RPChararacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
}
