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

class SecondViewController: UIViewController {
    var myCollectionView : UICollectionView!
    
    var data: [DayPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "郵便画像リスト"
        
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
        myCollectionView.backgroundColor = Utility().getBackColor()
        myCollectionView.alwaysBounceVertical = true
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
    }
    
    func getData() {
        API().getPostsData().done { (json) in
//            print(json)
//            self.setDummyData()
            
            for dayObj in json.arrayValue {
                print("*****************")
                var posts:[Post] = []
                
                for post in dayObj["posts"].arrayValue {
                    let fromformatter = DateFormatter()
                    fromformatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"
                    let date = fromformatter.date(from: post["date"].stringValue)!
                    
                    posts.append(Post(id: 1, date: moment(date), front: post["mail_img_url_front"].stringValue, back: post["mail_img_url_front"].stringValue, type: post["type"].stringValue))
                }
                
                let fromformatter = DateFormatter()
                fromformatter.dateFormat = "yyyy'-'MM'-'dd'"
                let date = fromformatter.date(from: dayObj["day"].stringValue)!
                
                
                self.data.append(DayPost(date: moment(date), posts: posts))
            }
            self.myCollectionView.reloadData()
        }.catch { (err) in
            //
        }
    }
    
//    func setDummyData() {
//        let now = moment()
//        let dummy = "http://wwwjp.kodak.com/JP/images/ja/digital/digitalcamera/performance/p880/sample/P880_02.jpg"
//        let data1a = Post(id: 1, date: now, front: dummy, back: dummy)
//        let data1b = Post(id: 1, date: now, front: dummy, back: dummy)
//        let data1c = Post(id: 1, date: now, front: dummy, back: dummy)
//
//        let data2a = Post(id: 1, date: now, front: dummy, back: dummy)
//        let data2b = Post(id: 1, date: now, front: dummy, back: dummy)
//        let data2c = Post(id: 1, date: now, front: dummy, back: dummy)
//
//        let data3a = Post(id: 1, date: now, front: dummy, back: dummy)
//        let data3b = Post(id: 1, date: now, front: dummy, back: dummy)
//
//        data = [
//            [data1a, data1b, data1c],
//            [data2a, data2b, data2c],
//            [data3a, data3b]
//        ]
//    }
}


extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CustomUICollectionViewCell
        cell.setImageUrl(url: "http://222.158.219.195:3000/" + data[indexPath.section].posts[indexPath.row].front)
        
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
        let isEqualYear = moment().year == data[indexPath.section].posts[indexPath.row].date.year
        let isEqualMonth = moment().month == data[indexPath.section].posts[indexPath.row].date.month
        let isEqualDay = moment().day == data[indexPath.section].posts[indexPath.row].date.day
        let isYesterDay = isEqualYear && isEqualMonth && yesterday.day == data[indexPath.section].posts[indexPath.row].date.day
        
        if isEqualYear && isEqualMonth && isEqualDay {
            reusableview.titleLabel.text = "今日"
        }else if isEqualYear && isEqualMonth && isYesterDay {
            reusableview.titleLabel.text = "昨日"
        }else {
            let dateFormatted = data[indexPath.section].posts[indexPath.row].date.format("M月d日")
            reusableview.titleLabel.text = dateFormatted
        }
        
        return reusableview
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.setData(selectedData: data[indexPath.section].posts[indexPath.row])
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


class HeaderView: UICollectionReusableView {
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Utility().getBackColor()
        
        titleLabel = UILabel()
        titleLabel.sizeToFit()
        
        self.addSubview(titleLabel)
        
        titleLabel.centerY(to: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
