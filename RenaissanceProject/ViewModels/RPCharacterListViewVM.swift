//
//  CharacterListViewVM.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 22/06/2024.
//

import UIKit

final class RPCharacterListViewVM: NSObject {
    func fetchCharacters() {
        RPService.shared.execute(.listCharactersRequest, expecting: RPGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url : "+String(model.results.first?.image ?? "Not found"))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}


extension RPCharacterListViewVM: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RPCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as? RPCharacterCollectionViewCell else { fatalError("Unsupported Cell") }
        let viewModel = RPCharacterCollectionViewCellVM(characterName: "Dowon", characterStatus: .alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width, height: width*1.5)
    }
}
