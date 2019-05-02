//
//  ViewController.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var kostViewModel = KostViewModel()
    var kostTableView : UITableView!
    private var roundButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        kostTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight-barHeight))
        kostTableView.register(UINib.init(nibName: "KostTableViewCell", bundle: nil), forCellReuseIdentifier: "KostTableViewCell")
        kostTableView.dataSource = self
        kostTableView.delegate = self
        self.view.addSubview(kostTableView)
        
        
        kostViewModel.delegate = self
        kostViewModel.loadKost()
    }
    
    func floatingButton() {
        roundButton = UIButton(type: .custom)
        roundButton.translatesAutoresizingMaskIntoConstraints = false
        roundButton.backgroundColor = UIColor.red
        // Make sure you replace the name of the image:
        roundButton.setTitle("+", for: .normal)
        roundButton.titleLabel?.font = .systemFont(ofSize: 30)
        // Make sure to create a function and replace DOTHISONTAP with your own function:
        
        // We're manipulating the UI, must be on the main thread:
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(self.roundButton)
                NSLayoutConstraint.activate([
                    keyWindow.trailingAnchor.constraint(equalTo: self.roundButton.trailingAnchor, constant: 30),
                    keyWindow.bottomAnchor.constraint(equalTo: self.roundButton.bottomAnchor, constant: 30),
                    self.roundButton.widthAnchor.constraint(equalToConstant: 75),
                    self.roundButton.heightAnchor.constraint(equalToConstant: 75)])
            }
            // Make the button round:
            self.roundButton.layer.cornerRadius = 37.5
            // Add a black shadow:
            self.roundButton.layer.shadowColor = UIColor.black.cgColor
            self.roundButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            self.roundButton.layer.masksToBounds = false
            self.roundButton.layer.shadowRadius = 2.0
            self.roundButton.layer.shadowOpacity = 0.5
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        floatingButton()
    }


}

