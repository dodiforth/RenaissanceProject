//
//  RPCharacterDetailViewController.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 23/06/2024.
//

import UIKit



/// Controller to show info about single Character
class RPCharacterDetailViewController: UIViewController {
    
    private let viewModel: RPCharacterDetailViewVM
    
    init(viewModel: RPCharacterDetailViewVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.characterName
        navigationItem.largeTitleDisplayMode = .never
    }
    
}
