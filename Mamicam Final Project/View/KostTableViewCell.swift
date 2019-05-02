//
//  KostTableViewCell.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import UIKit

class KostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var kostImageVIew: UIImageView!
    @IBOutlet weak var nameKostLabel: UILabel!
    @IBOutlet weak var detailKostLabel: UILabel!
    @IBOutlet weak var categoryKostLabel: UILabel!
    @IBOutlet weak var priceKostLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
