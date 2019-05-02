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
        roundButton.setTitle("+", for: .normal)
        roundButton.titleLabel?.font = .systemFont(ofSize: 30)
        roundButton.addTarget(self, action: #selector(newKost), for: UIControl.Event.touchUpInside)
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(self.roundButton)
                NSLayoutConstraint.activate([
                    keyWindow.trailingAnchor.constraint(equalTo: self.roundButton.trailingAnchor, constant: 30),
                    keyWindow.bottomAnchor.constraint(equalTo: self.roundButton.bottomAnchor, constant: 30),
                    self.roundButton.widthAnchor.constraint(equalToConstant: 75),
                    self.roundButton.heightAnchor.constraint(equalToConstant: 75)])
            }
            self.roundButton.layer.cornerRadius = 37.5
            self.roundButton.layer.shadowColor = UIColor.black.cgColor
            self.roundButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            self.roundButton.layer.masksToBounds = false
            self.roundButton.layer.shadowRadius = 2.0
            self.roundButton.layer.shadowOpacity = 0.5
            
        }
    }
    
    @objc func newKost() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewKostViewController") as? NewKostViewController {
            self.show(controller, sender: self)
        } else {
            print("NewKostViewController not found")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        floatingButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if roundButton.superview != nil {
            DispatchQueue.main.async {
                self.roundButton.removeFromSuperview()
            }
        }
    }


}

