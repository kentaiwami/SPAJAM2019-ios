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
//        navigationController?.navigationBar.barTintColor = UIColor.white

        navigationBar.barTintColor = Utility().getMainColor()
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
    }
}
