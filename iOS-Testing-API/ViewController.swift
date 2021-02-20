//
//  ViewController.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 17/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "A"
    }
    
    @IBAction private func challengeView(_ sender: Any) {
        let vc = CharacterTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

