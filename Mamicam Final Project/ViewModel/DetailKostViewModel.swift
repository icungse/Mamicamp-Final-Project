//
//  DetailKostViewModel.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import Foundation

protocol DetailKostViewModelDelegate {
    func onDetailKostLoaded()
}

class DetailKostViewModel {
    
    var delegate: DetailKostViewModelDelegate?
    var kostDetail: KostModel?
    var url = "https://esjeruks.com/api-mamicamp/public/api/room"
    
    func loadKost(roomId: String) {
        NetworkFacade.callGetApi(url: url+roomId, parameters: [:]) {
            (json) in
            for object in json["data"].arrayValue {
                self.kostDetail = KostModel(object)
            }
            self.delegate?.onDetailKostLoaded()
        }
    }
}
