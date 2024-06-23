//
//  RPCharacterViewController.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import UIKit

/// Controller to show and search for Characters
final class RPCharacterViewController: UIViewController, RPCharacterListViewDelegate {

    
    
    private let characterListView = RPCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpViews()
        
    }
    
    private func setUpViews() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
    
    // MARK: - RPCharacterListViewDelegate
    func rpCharacterListView(_ characterListView: RPCharacterListView, didSelectCharacter character: RPCharacter) {
        // Open Detail controller for that character
        let viewModel = RPCharacterDetailViewVM(characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image))
        let detailVC = RPCharacterDetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
