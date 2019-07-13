//
//  AuthViewController.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/14.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Utility().getBackColor()
        
        createView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "はじめに"
        self.navigationItem.hidesBackButton = true
    }
    
    func createView() {
        let sc = UIScrollView()
        sc.frame = self.view.frame
        sc.delegate = self
        sc.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 1000)
        self.view.addSubview(sc)
        
//        sc.width(self.view.frame.width)
//        sc.height(self.view.frame.height + 100)
        
        let postImage = UIImageView(image: UIImage(named: "post.png")?.scaleImage(scaleSize: 1.0))
        postImage.contentMode = .scaleAspectFit
        sc.addSubview(postImage)
        self.view.addSubview(postImage)
        
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        
        let margin = self.view.frame.width * 0.2
        
        postImage.left(to: self.view, offset: margin)
        postImage.right(to: self.view, offset: -margin)
        postImage.top(to: self.view, offset: self.view.frame.width * 0.15 + navBarHeight!)
        postImage.width(self.view.frame.width * 0.6)
        postImage.height(self.view.frame.width * 0.6)
        
        let titleLabel = UILabel()
        titleLabel.text = "手紙を受け取る準備"
        titleLabel.font = UIFont.systemFont(ofSize: 28)
        sc.addSubview(titleLabel)
        
        titleLabel.topToBottom(of: postImage, offset: self.view.frame.width * 0.1)
        titleLabel.centerX(to: self.view)
        
        let detailLabel = UILabel()
        detailLabel.text = "製品本体に付属するIDを入力してください。"
        detailLabel.font = UIFont.systemFont(ofSize: 16)
        sc.addSubview(detailLabel)
        
        detailLabel.topToBottom(of: titleLabel, offset: self.view.frame.width * 0.1)
        detailLabel.centerX(to: self.view)
        
        
        
        
        let textField = UITextField()
        textField.placeholder = "あなたのポストのID"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.delegate = self
        sc.addSubview(textField)
        
        textField.topToBottom(of: detailLabel, offset: self.view.frame.width * 0.08)
        textField.left(to: self.view, offset: self.view.frame.width * 0.1)
        textField.right(to: self.view, offset: -self.view.frame.width * 0.1)
        textField.width(self.view.frame.width * 0.8)
//        textField.centerX(to: self.view)
    }
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return")
        return true
    }
    
    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Clear")
        return true
    }
    
    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }
    
    // テキストフィールドでの編集が終了する直前での処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
    }
}


extension AuthViewController: UIScrollViewDelegate {
    
}
