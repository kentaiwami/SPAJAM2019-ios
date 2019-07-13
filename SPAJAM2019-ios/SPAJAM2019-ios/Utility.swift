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
import PopupDialog

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
//                        showStandardAlert(title: "ネットワークエラー", msg: "ネットワーク接続を確認してください。", vc: <#T##UIViewController#>)
//                        let err_msg = json["msg"].stringValue + "[" + String(json["code"].intValue) + "]"
                        seal.reject(NSError(domain: "ネットワークエラー", code: -1))
//                        seal.reject(NSError(domain: err_msg, code: (response.response?.statusCode)!))
                    }
                case .failure(_):
                    seal.reject(NSError(domain: "ネットワークエラー", code: -1))
//                    let err_msg = "エラーが発生しました[-1]"
//                    seal.reject(NSError(domain: err_msg, code: (response.response?.statusCode)!))
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
    
    func showStandardAlert(title: String, msg: String, vc: UIViewController, isLeft: Bool = false, completion: @escaping (() -> Void) = {}) {
        let button = DefaultButton(title: "OK", dismissOnTap: true) {}
        let popup = PopupDialog(title: title, message: msg) {
            completion()
        }
        popup.transitionStyle = .zoomIn
        popup.addButtons([button])
        
        if isLeft {
            PopupDialogDefaultView.appearance().messageTextAlignment = .left
        }
        
        vc.present(popup, animated: true, completion: nil)
    }


}
