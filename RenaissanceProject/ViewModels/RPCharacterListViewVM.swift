//
//  CharacterListViewVM.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 22/06/2024.
//

import UIKit

final class RPCharacterListViewVM: NSObject {
    
    private var characters: [RPCharacter] = []{
        didSet{
            for character in characters {
                let viewModel = RPCharacterCollectionViewCellVM(characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
            
        }
    }
    
    private var cellViewModels: [RPCharacterCollectionViewCellVM] = []
    
    public func fetchCharacters() {
        RPService.shared.execute(.listCharactersRequest, expecting: RPGetAllCharactersResponse.self) 
        { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters = results
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}


extension RPCharacterListViewVM: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RPCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as? RPCharacterCollectionViewCell else { fatalError("Unsupported Cell") }
        let viewModel = cellViewModels[indexPath.row]
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
