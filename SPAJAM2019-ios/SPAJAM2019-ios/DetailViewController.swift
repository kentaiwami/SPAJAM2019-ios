//
//  DetailViewController.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/14.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedData: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Utility().getBackColor()
        
    }
    
    func setData(selectedData: Post) {
        self.selectedData = selectedData
    }
}
