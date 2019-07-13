//
//  Utility.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/13.
//  Copyright © 2019 Kenta. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

class Utility {
    func getMainColor() -> UIColor {
        return UIColor.init(red: 225/255, green: 56/255, blue: 44/255, alpha: 1.0)
    }
    
    func getBackColor() -> UIColor {
        return UIColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
    }
    
    func getNegativeColor() -> UIColor {
        return UIColor.init(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0)
    }
    
    func get(url: String) -> Promise<JSON> {
        
        let promise = Promise<JSON> { seal in
            Alamofire.request(url, method: .get).validate(statusCode: 200..<600).responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("***** GET Auth API Results *****")
                    //                    print(json)
                    print("***** GET Auth API Results *****")
                    
                    if self.isHTTPStatus2XX(statusCode: response.response?.statusCode) && !json["code"].exists() {
                        seal.fulfill(json)
                    }else {
                        let err_msg = json["msg"].stringValue + "[" + String(json["code"].intValue) + "]"
                        seal.reject(NSError(domain: err_msg, code: (response.response?.statusCode)!))
                    }
                case .failure(_):
                    let err_msg = "エラーが発生しました[-1]"
                    seal.reject(NSError(domain: err_msg, code: (response.response?.statusCode)!))
                }
            }
        }
        return promise
    }
    
    func isHTTPStatus2XX(statusCode: Int?) -> Bool {
        let code = String(statusCode!)
        var results:[String] = []
        
        if code.pregMatche(pattern: "2..", matches: &results) {
            return true
        }else {
            return false
        }
    }

}
