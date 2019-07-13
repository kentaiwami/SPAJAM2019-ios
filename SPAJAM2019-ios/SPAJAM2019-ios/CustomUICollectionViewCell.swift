//
//  CustomUICollectionViewCell.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/13.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit
import AlamofireImage

class CustomUICollectionViewCell: UICollectionViewCell {
    var image : UIImageView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image = UIImageView()
        image?.contentMode = .scaleAspectFit
        
        self.contentView.addSubview(image!)
        
        image!.edges(to: self)
//        image!.top(to: self, offset: 5)
//        image!.left(to: self, offset: 5)
//        image!.right(to: self, offset: 5)
//        image!.height(self.frame.height * 0.7)
    }
    
    func setImageUrl(url: String) {
        let encURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        image!.af_setImage(withURL: encURL)
    }
}
