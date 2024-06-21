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
        
        let request = RPRequest(endpoint: .character, queryParameters: [URLQueryItem(name: "name", value: "rick"),URLQueryItem(name: "status", value: "alive")])        
       
    }
    
    
}
