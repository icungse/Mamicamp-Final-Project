//
//  AnyViewExtension.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    func loadImageUrl(url: String) {
        self.af_setImage(withURL: URL(string: url)!)
    }
}
