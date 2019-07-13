//
//  FirstViewController.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/13.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit
import TinyConstraints

class FirstViewController: UIViewController, UIScrollViewDelegate {
//    var scrollView = UIScrollView()
//    var refreshControll = UIRefreshControl()
//    let cellId = "itemCell"
//    var lastView: UIView?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        let posts = getData()
//
//        initScrollView()
//
//        for post in posts {
//            createDayLabel(date: post.date)
//            createCollectionView()
//        }
//    }
//
//    func initScrollView() {
//        scrollView.delegate = self
//        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
//        self.view.addSubview(scrollView)
//        scrollView.edges(to: self.view)
//        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + 200)
//    }
//
//    func getData() -> [Post] {
//        let dummy = "http://wwwjp.kodak.com/JP/images/ja/digital/digitalcamera/performance/p880/sample/P880_02.jpg"
//        let data1 = Post(id: 1, date: Date(), image: dummy)
//        let data2 = Post(id: 1, date: Date(), image: dummy)
//        let data3 = Post(id: 1, date: Date(), image: dummy)
//        let data4 = Post(id: 1, date: Date(), image: dummy)
//        return [data1, data2, data3, data4]
//    }
//
//    func createDayLabel(date: Date) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateString = dateFormatter.string(from: date)
//
//        let dateLabel = UILabel()
//        dateLabel.text = dateString
//        dateLabel.sizeToFit()
//        scrollView.addSubview(dateLabel)
//
//        if let hoge = lastView {
//            dateLabel.topToBottom(of: hoge, offset: 20)
//        }else {
//            dateLabel.top(to: scrollView, offset: 20)
//        }
//
//
//        lastView = dateLabel
//    }
//
//
//    func createCollectionView() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//
//        let postsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
//        postsCollectionView.backgroundColor = UIColor.red
//        postsCollectionView.register(UINib(nibName: "PostCell", bundle: nil), forCellWithReuseIdentifier: "PostCell")
//        postsCollectionView.delegate = self
//        postsCollectionView.dataSource = self
//        postsCollectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue) | UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue)))
//        postsCollectionView.alwaysBounceVertical = true
//
//        scrollView.addSubview(postsCollectionView)
//
//        postsCollectionView.topToBottom(of: lastView!, offset: 20)
//
//        lastView = postsCollectionView
//    }
//}
//
//
//extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
//        cell.setAll(url: "http://wwwjp.kodak.com/JP/images/ja/digital/digitalcamera/performance/p880/sample/P880_02.jpg")
//
//        print("*************************")
//        print(lastView!)
//        print("*************************")
//
//        return cell
//    }
}
