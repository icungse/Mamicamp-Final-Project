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


}

