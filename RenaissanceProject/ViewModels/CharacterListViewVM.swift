//
//  CharacterListViewVM.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 22/06/2024.
//

import Foundation

struct CharacterListViewVM {
    func fetchCharacters() {
        RPService.shared.execute(.listCharactersRequest, expecting: RPGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total info: "+String(model.info.count))
                print("Total results: "+String(model.results.count))
                print("Total pages: "+String(model.info.pages))

            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
