//
//  CharacterBaseViewController.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 20/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation
import UIKit

class CharacterBaseViewController: UIViewController {
    
    internal lazy var activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(frame: CGRect.zero)
        aiv.hidesWhenStopped = true
        aiv.style = .large
        aiv.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        return aiv
    } ()
    
    internal func setupActivityIndicator() {
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        activityIndicator.stopAnimating()
    }
}
