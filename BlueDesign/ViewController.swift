//
//  ViewController.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 03/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var headerView: MVSegmentedHeaderView!
    private var bottomView: UIView!
    private var pageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHeaderView()
        addBottomView()
        addCentralCard()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    private func addHeaderView() {
        headerView = MVSegmentedHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        headerView.backgroundColor = UIColor(named: "Sapphire")
        view.addSubview(headerView)
        headerView.delegate = self
        headerView.setTitle(title: "Giornaliero")
        headerView.setSegmentItems(items: ["Minzione", "Acqua"])
    }
    
    private func addBottomView(){
        bottomView = UIView(frame: CGRect(x: 0, y: headerView.frame.maxY-20, width: view.frame.width, height: view.frame.height-headerView.frame.height+10))
        bottomView.layer.cornerRadius = 20
        view.addSubview(bottomView)
        bottomView.bringSubviewToFront(headerView)
        bottomView.backgroundColor = UIColor.systemBackground
        bottomView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func addCentralCard() {
        let card = UIView(frame: CGRect(x: bottomView.frame.minX+15, y: bottomView.frame.minY-60, width: view.frame.width-30, height: 120))
        card.layer.cornerRadius = 10
        card.backgroundColor = UIColor.systemBackground
        card.layer.masksToBounds = false
        view.addSubview(card)
        card.layer.shadowPath = UIBezierPath(rect: card.bounds).cgPath
        self.traitCollection.performAsCurrent {
            card.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        }
        card.layer.shadowRadius = 20
        card.layer.shadowOffset = .zero
        card.layer.shadowOpacity = 0.7
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive=true
        card.centerYAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0).isActive = true
        
        let image = UIImageView(image: UIImage(named: "icons8-acqua3-60"))
        card.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 70).isActive = true
        image.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 20).isActive = true
        image.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -10).isActive = true
        image.tintColor = UIColor(named: "Sapphire")
        image.alpha = 0.6
        
        let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: card.frame.width, height: 25))
               descriptionLabel.font = .boldSystemFont(ofSize: 25)
               descriptionLabel.textAlignment = .center
               descriptionLabel.text = "Totale giornaliero"
               descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
               card.addSubview(descriptionLabel)
               descriptionLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 10).isActive = true
               descriptionLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 10).isActive = true
               descriptionLabel.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -10).isActive = true
        
        let totalTimeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: card.frame.width/2, height: card.frame.height-25))
        totalTimeLabel.font = .boldSystemFont(ofSize: 50)
        totalTimeLabel.textAlignment = .center
        totalTimeLabel.text = "15"
        totalTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(totalTimeLabel)
        totalTimeLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -10).isActive = true
        totalTimeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        totalTimeLabel.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -10).isActive = true
        totalTimeLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 10).isActive = true
        
        
        
    }
    
}

extension ViewController: MVHeaderSegmentDelegate {
    func segmentControlChanged(segmentControll: UISegmentedControl, currentIndex: Int) {
        print("Selected index \(currentIndex)")
    }
    
    
}
