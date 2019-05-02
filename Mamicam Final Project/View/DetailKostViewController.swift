//
//  DetailKostViewController.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import UIKit

class DetailKostViewController: UIViewController {
    
    lazy var detailKostViewModel = DetailKostViewModel()
    
    @IBOutlet weak var kostImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var priceTextLabel: UILabel!
    @IBOutlet weak var categoryTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var kostModel: KostModel!
    var roomId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        
    }
    
    func updateLabel() {
        kostImageView.loadImageUrl(url: kostModel.image_url)
        nameTextLabel.text = kostModel.name
        detailTextLabel.text = kostModel.type
        categoryTextLabel.text = kostModel.category
        priceTextLabel.text = " - " + kostModel.price
        descriptionTextLabel.text = kostModel.description
    }
}
