//
//  DetailViewController.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/14.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    var selectedData: Post!
    var footer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Utility().getBackColor()
        createView()
    }
    
    func setData(selectedData: Post) {
        self.selectedData = selectedData
    }
    
    func createView() {
        let sc = UIScrollView()
        sc.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 100)
        sc.delegate = self
        self.view.addSubview(sc)
        
        sc.edges(to: self.view)
        
        let frontImage = UIImageView()
        let url = "http://222.158.219.195:3000/" + selectedData.front
        let encURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        frontImage.af_setImage(withURL: encURL)
        frontImage.contentMode = .scaleAspectFit
        sc.addSubview(frontImage)
        frontImage.top(to: sc, offset: -195)
        frontImage.width(self.view.frame.width)
        frontImage.height(self.view.frame.height)
        
        let backImage = UIImageView()
        let backurl = "http://222.158.219.195:3000/" + selectedData.back
        let backencURL = URL(string: backurl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        backImage.af_setImage(withURL: backencURL)
        backImage.contentMode = .scaleAspectFit
        sc.addSubview(backImage)
        backImage.topToBottom(of: frontImage, offset: -195*2+10)
        backImage.width(self.view.frame.width)
        backImage.height(self.view.frame.height)
        
        footer = UIView()
        footer.backgroundColor = UIColor.white
        sc.addSubview(footer)
        
        let footerHeight = 130 as CGFloat
        
        footer.topToBottom(of: self.view, offset: -footerHeight)
        footer.width(self.view.frame.width)
        footer.height(footerHeight)
        
        let text1 = UILabel()
        text1.text = "\(selectedData.date.month)月\(selectedData.date.day)日に投稿されました。"
        text1.font = UIFont.boldSystemFont(ofSize: 20)
        text1.sizeToFit()
        
        let text2 = UILabel()
        text2.text = "時刻：\(selectedData.date.hour)時\(selectedData.date.minute)分"
        text2.font = UIFont.systemFont(ofSize: 16)
        text2.sizeToFit()
        
        var type = ""
        if selectedData.type == "huzai" {
            type = "不在通知"
        }else if selectedData.type == "hagaki" {
            type = "ハガキ"
        }else {
            type = "チラシ"
        }
        
        let text3 = UILabel()
        text3.text = type
        text3.font = UIFont.systemFont(ofSize: 16)
        text3.sizeToFit()
        
        
        footer.addSubview(text1)
        footer.addSubview(text2)
        footer.addSubview(text3)
        
        text1.top(to: footer, offset: self.view.frame.width * 0.06)
        text1.left(to: footer, offset: self.view.frame.width * 0.04)
        text2.topToBottom(of: text1, offset: self.view.frame.width * 0.04)
        text2.left(to: footer, offset: self.view.frame.width * 0.04)
        text3.topToBottom(of: text2, offset: self.view.frame.width * 0.02)
        text3.left(to: footer, offset: self.view.frame.width * 0.04)
        
        self.view.addSubview(footer)
//        footer.topToBottom(of: sc, offset: 100)
//        footer.height(200)
        
//        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: cardViews.last!.frame.height+cardViews.last!.frame.origin.y+self.base_margin)
        
//        sc.contentSize = CGSize(width: self.view.bounds.width, height: backImage.frame.height + backImage.frame.origin.y + 300)
    }
}


extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        footer.frame = CGRect(x:0, y:0+scrollView.contentOffset.y, width:self.view.frame.width, height:200)
//        Header.frame = CGRect(x:0, y:0+scrollView.contentOffset.y, width:375, height:128)
    }
}
