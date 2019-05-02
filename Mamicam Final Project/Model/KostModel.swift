//
//  KostModel.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import Foundation
import SwiftyJSON

class KostModel {
    var baseUrl = "https://esjeruks.com/api-mamicamp/public/api/room"
    
    var id : String = ""
    var name : String = ""
    var description : String = ""
    var type : String = ""
    var price : String = ""
    var category : String = ""
    var image_url : String = ""
    
    required init(_ object: JSON) {
        self.id = object["id"].stringValue
        self.name = object["name"].stringValue
        self.description = object["description"].stringValue
        self.type = object["type"].stringValue
        self.price = object["price"].stringValue
        self.category = object["category"].stringValue
        self.image_url = object["image_url"].stringValue
    }
}
