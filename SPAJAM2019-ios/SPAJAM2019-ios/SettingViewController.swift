//
//  SettingViewController.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/14.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Utility().getMainColor()
        
        create()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
    }
    
    func create() {
        let logo = UIImageView(image: UIImage(named: "logo.png")?.scaleImage(scaleSize: 1.0))
        logo.contentMode = .scaleAspectFit
        self.view.addSubview(logo)
        
        let margin = self.view.frame.width * 0.2
        
        logo.left(to: self.view, offset: margin)
        logo.right(to: self.view, offset: -margin)
        logo.top(to: self.view, offset: self.view.frame.width * 0.5)
        logo.width(logo.frame.width)
        logo.height(logo.frame.height)
        
        let button = UIButton()
        let buttonImage = UIImage(named: "hajimeru2.png")?.scaleImage(scaleSize: 1.0)
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(self.tapButton(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.topToBottom(of: logo, offset: self.view.frame.width * 0.3)
        button.left(to: self.view, offset: margin)
        button.right(to: self.view, offset: -margin)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        button.width((buttonImage?.size.width)!)
        button.height((buttonImage?.size.height)!)
    }
    
    @objc func tapButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "root")
        viewController2.modalPresentationStyle = .fullScreen
        present(viewController2, animated: true, completion: nil)
//        let vc = AuthViewController()
//        self.navigationController?.pushViewController(viewController2, animated: true)
    }
}
