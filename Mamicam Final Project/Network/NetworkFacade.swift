//
//  NetworkFacade.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class NetworkFacade {
    static func callGetApi (url: String, parameters: [String: String] = [:], callback: @escaping (JSON) -> ()) {
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default) .responseSwiftyJSON {
            (responseData) in
                guard let value = responseData.result.value else {
                    return
                }
            
                callback(value)
        }
    }
    
    static func callPostApi(url: String, parameters: [String: Any] = [:], callback: @escaping (JSON) -> ()) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        print("post Param \(parameters)")
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header) .responseSwiftyJSON { (responseData) in
            print("response \(responseData)")
            guard let value = responseData.result.value else {
                return
            }
            callback(value)
            
        }
        
    }
}
