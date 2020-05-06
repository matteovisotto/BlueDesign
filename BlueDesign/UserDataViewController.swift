//
//  UserDataViewController.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 04/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

class UserDataViewController: UIViewController {
    
    @IBOutlet weak var headerView: MVNavigationHeaderView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
           return .lightContent
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.backgroundColor = UIColor(named: "Sapphire")
        headerView.setTitle(title: "Dati utente")
        headerView.delegate = self
    }

}

extension UserDataViewController: MVNavigationHeaderDelegate {
    func didTapBackButton(backButton: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
