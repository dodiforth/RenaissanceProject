//
//  ViewController.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 20/06/2024.
//

import UIKit

final class RPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }

    private func setUpTabs() {
        let characterVC = RPCharacterViewController()
        let locationVC = RPLocationViewController()
        let episodeVC = RPEpisodeViewController()
        let settingsVC = RPSettingsViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: locationVC)
        let nav3 = UINavigationController(rootViewController: episodeVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "location"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "film"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}

