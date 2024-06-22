//
//  Extensions.swift
//  RenaissanceProject
//
//  Created by Dowon Kim on 22/06/2024.
//

import UIKit

extension UIView {
    
    // Make sure to call this function in your view controller to accept multiple views
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}
