//
//  MyNavigationViewController.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/14.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit

class MyNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor.init(red: 255/255, green: 56/255, blue: 44/255, alpha: 1.0)
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
    }
}
