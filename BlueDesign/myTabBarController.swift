//
//  myTabBarController.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 03/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var menuIsOpen: Bool = false
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        setLayout()
        setupMiddleButton()
    }
    
    private func setLayout(){
        self.tabBar.tintColor = UIColor(named: "Sapphire")
        let items = self.tabBar.items!
               items[0].title = ""
               items[1].title = ""
               
               items[0].imageInsets = UIEdgeInsets(top: 5,left: 0,bottom: -5,right: 0)
               items[1].imageInsets = UIEdgeInsets(top: 5,left: -10,bottom: -5,right: 10)
               
    }
    
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
        middleBtn.tag = 101
        middleBtn.layer.cornerRadius = 25
        middleBtn.tintColor = UIColor.white
        middleBtn.setImage(UIImage(named: "add"), for: .normal)
        middleBtn.backgroundColor = UIColor(named: "Sapphire")
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }

       // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        
    }
      
    

}
