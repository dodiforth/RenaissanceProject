//
//  RPCharacterViewController.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 21/06/2024.
//

import UIKit

/// Controller to show and search for Characters
final class RPCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
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
