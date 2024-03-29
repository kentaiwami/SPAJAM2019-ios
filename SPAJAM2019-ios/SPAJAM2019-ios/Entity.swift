//
//  Entity.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/13.
//  Copyright © 2019 Kenta. All rights reserved.
//

import Foundation
import SwiftMoment

struct Post {
    var id: Int
    var date: Moment
    var front: String
    var back: String
    var type: String
}

struct DayPost {
    var date: Moment
    var posts: [Post]
}
