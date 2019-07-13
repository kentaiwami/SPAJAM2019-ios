//
//  FileBrowseCell.swift
//  Shifree
//
//  Created by 岩見建汰 on 2018/07/07.
//  Copyright © 2018年 Kenta Iwami. All rights reserved.
//

import UIKit
import AlamofireImage

class PostCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.top(to: self, offset: 5)
        thumbnailImageView.left(to: self, offset: 5)
        thumbnailImageView.right(to: self, offset: 5)
        thumbnailImageView.height(self.frame.height * 0.7)
    }
    
    func setAll(url: String) {
        let encURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        thumbnailImageView.af_setImage(withURL: encURL)
    }
}
