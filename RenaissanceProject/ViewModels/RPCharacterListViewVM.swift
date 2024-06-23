//
//  CharacterListViewVM.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 22/06/2024.
//

import UIKit

protocol RPCharacterListViewVMDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: RPCharacter)
}


/// View Model to handle character list view logic
final class RPCharacterListViewVM: NSObject {
    
    public weak var delegate: RPCharacterListViewVMDelegate?
    
    public var isLoadingMoreCharacters = false
    
    private var characters: [RPCharacter] = []{
        didSet{
            for character in characters {
                let viewModel = RPCharacterCollectionViewCellVM(characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
            
        }
    }
    
    private var cellViewModels: [RPCharacterCollectionViewCellVM] = []
    
    private var apiInfo: RPGetAllCharactersResponse.Info? = nil
    
    // Fetch initial set of characters (20)
    public func fetchCharacters() {
        RPService.shared.execute(.listCharactersRequest, expecting: RPGetAllCharactersResponse.self) 
        { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    // Paginate if we are near the end or additional characters are needed
    public func fetchAdditionalCharacters() {
        //fetch characters
        
    }
    
    public var shouldShowLoadMoreIndicator: Bool {
        
        return apiInfo?.next != nil
    }
    
}


// MARK: - CollectionView
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
              let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RPFooterLoadingCollectionReusableView.identifier, for: indexPath) as? RPFooterLoadingCollectionReusableView
        else {
            fatalError("Unsupported")
        }
    
        footer.startAnimating()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreIndicator else {
            return .zero
        }
        
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width, height: width*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
}

// MARK: - ScrollView
extension RPCharacterListViewVM: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator else {
            return
        }
    }
}
