//
//  RPCharacterCollectionViewCellVM.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 22/06/2024.
//

import Foundation

final class RPCharacterCollectionViewCellVM {
    
    public let characterName: String
    private let characterStatus: RPChararacterStatus
    private let characterImageUrl: URL?
    
    // MARK: - Init
    
    init(
        characterName: String,
        characterStatus: RPChararacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return "Status : \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
                completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
            task.resume()
        }
}
