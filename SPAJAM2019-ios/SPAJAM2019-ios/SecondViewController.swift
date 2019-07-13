//
//  SecondViewController.swift
//  SPAJAM2019-ios
//
//  Created by 岩見建汰 on 2019/07/13.
//  Copyright © 2019 Kenta. All rights reserved.
//

import UIKit
import SwiftMoment
import Alamofire
import SwiftyJSON
import PromiseKit

let mainColor = UIColor.init(red: 255, green: 56, blue: 44, alpha: 1.0)
let backColor = UIColor.init(red: 238, green: 238, blue: 238, alpha: 1.0)
let negative = UIColor.init(red: 157, green: 157, blue: 157, alpha: 1.0)

class SecondViewController: UIViewController {
    var myCollectionView : UICollectionView!
    
    var data: [[Post]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.navigationItem.title = "郵便画像リスト"
        self.tabBarController?.navigationController?.navigationBar.barTintColor = .red
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        getData()
        
        let cellSize = self.view.frame.width * 0.45
        let margin = self.view.frame.width * 0.04
        let margin2 = self.view.frame.width * 0.06
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:cellSize, height:cellSize)
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        layout.headerReferenceSize = CGSize(width:100,height:margin2)
        layout.minimumInteritemSpacing = 0
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")
        myCollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section")
        myCollectionView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 200)
        myCollectionView.backgroundColor = backColor
        myCollectionView.alwaysBounceVertical = true
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
    }
    
    func getData() {
        let now = moment()
        let dummy = "http://wwwjp.kodak.com/JP/images/ja/digital/digitalcamera/performance/p880/sample/P880_02.jpg"
        let data1a = Post(id: 1, date: now, image: dummy)
        let data1b = Post(id: 1, date: now, image: dummy)
        let data1c = Post(id: 1, date: now, image: dummy)
        
        let data2a = Post(id: 1, date: now-1.days, image: dummy)
        let data2b = Post(id: 1, date: now-1.days, image: dummy)
        let data2c = Post(id: 1, date: now-1.days, image: dummy)
        
        let data3a = Post(id: 1, date: now-2.days, image: dummy)
        let data3b = Post(id: 1, date: now-2.days, image: dummy)
        
        data = [
            [data1a, data1b, data1c],
            [data2a, data2b, data2c],
            [data3a, data3b]
        ]
    }
}


extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CustomUICollectionViewCell
        cell.setImageUrl(url: data[indexPath.section][indexPath.row].image)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 90, right: 0)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! HeaderView
        
        let yesterday = moment()-1.days
        let isEqualYear = moment().year == data[indexPath.section][indexPath.row].date.year
        let isEqualMonth = moment().month == data[indexPath.section][indexPath.row].date.month
        let isEqualDay = moment().day == data[indexPath.section][indexPath.row].date.day
        let isYesterDay = isEqualYear && isEqualMonth && yesterday.day == data[indexPath.section][indexPath.row].date.day
        
        if isEqualYear && isEqualMonth && isEqualDay {
            reusableview.titleLabel.text = "今日"
        }else if isEqualYear && isEqualMonth && isYesterDay {
            reusableview.titleLabel.text = "昨日"
        }else {
            let dateFormatted = data[indexPath.section][indexPath.row].date.format("M月d日")
            reusableview.titleLabel.text = dateFormatted
        }
        
        return reusableview
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


class HeaderView: UICollectionReusableView {
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = backColor
        
        titleLabel = UILabel()
        titleLabel.sizeToFit()
        
        self.addSubview(titleLabel)
        
        titleLabel.centerY(to: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
