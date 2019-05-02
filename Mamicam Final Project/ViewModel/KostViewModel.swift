//
//  KostViewModel.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import Foundation

protocol KostViewModelDelegate {
    func onKostLoaded()
}

class KostViewModel {
    
    var delegate: KostViewModelDelegate?
    var listKost = [KostModel]()
    
    func loadKost() {
        NetworkFacade.callGetApi(url: "https://esjeruks.com/api-mamicamp/public/api/room", parameters: [:]) {
            (json) in
            for object in json["data"].arrayValue {
                let kost = KostModel(object)
                self.listKost.append(kost)
            }
            
            print(self.listKost)
            self.delegate?.onKostLoaded()
        }
    }
}
