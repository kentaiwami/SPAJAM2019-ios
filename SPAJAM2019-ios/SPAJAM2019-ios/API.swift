//
//  API.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/13.
//  Copyright © 2019 Kenta. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

class API {
    func getPostsData() -> Promise<JSON> {
        return Utility().get(url: "http://3.115.146.8:3000/mail")
    }
}
