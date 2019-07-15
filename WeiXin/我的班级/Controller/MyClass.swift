//
//  MyClass.swift
//  WeiXin
//
//  Created by administrator on 6/29/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import FSPagerView

class MyClass: UIViewController, UITableViewDelegate, UITableViewDataSource, FSPagerViewDataSource, FSPagerViewDelegate {
    
    var pageViewImages:[String] = ["骑车","旅行黑板","上课","校车田野","云朵","绿色黑板","梦想"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pagerView: FSPagerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor =
            UIColor(red: 42/255, green: 185/255, blue: 155/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyClassCell", bundle: nil), forCellReuseIdentifier: "MyClassCell")
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cellOfThirdTableView")
        view.backgroundColor = UIColor.white
        
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.layer.masksToBounds = true
        pagerView.layer.cornerRadius = 8
        pagerView.itemSize = CGSize(width:view.frame.width - 20 , height: 170)
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.automaticSlidingInterval = 4.0
        pagerView.isInfinite = true
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return pageViewImages.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = 8
        cell.imageView?.image = UIImage(named: pageViewImages[index])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfThirdTableView", for: indexPath)
            
            let label1 = cell.viewWithTag(3001) as! UILabel
            let label2 = cell.viewWithTag(3002) as! UILabel
            let label3 = cell.viewWithTag(3003) as! UILabel
            let image4 = cell.viewWithTag(3004) as! UIImageView
            let label6 = cell.viewWithTag(3006) as! UILabel
            let label8 = cell.viewWithTag(3008) as! UILabel
            let image10 = cell.viewWithTag(3000) as! UIImageView
            let label0 = cell.viewWithTag(2999) as! UILabel
            label0.text = "意大利军队的战斗力究竟如何？"
            label1.text = "校图书室"
            label2.text = "16分钟前"
            label3.text = "关于意大利军的战斗力，排名第一的那个辟谣贴在知乎上被转了五次。然而这个辟谣贴和造谣帖毫无区别，很有点周带鱼大战袁腾飞的感觉"
            label6.text = "665"
            label8.text = "218"
            image4.image = UIImage(named: "意大利国旗")
            image10.image = UIImage(named: "小白兔")
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassCell", for: indexPath)
            let label1 = cell.viewWithTag(1001) as! UILabel
            let label2 = cell.viewWithTag(1005) as! UILabel
            let label3 = cell.viewWithTag(1006) as! UILabel
            let image1 = cell.viewWithTag(1002) as! UIImageView
            let image2 = cell.viewWithTag(1003) as! UIImageView
            let image3 = cell.viewWithTag(1004) as! UIImageView
            label1.text = "热烈祝贺本校2019年毕业典礼成功举办！"
            label2.text = "校宣传部"
            label3.text = "1068评论"
            image1.image = UIImage(named: "王府学校1")
            image2.image = UIImage(named: "王府学校3")
            image3.image = UIImage(named: "王府学校4")
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassCell", for: indexPath)
            let label1 = cell.viewWithTag(1001) as! UILabel
            let label2 = cell.viewWithTag(1005) as! UILabel
            let label3 = cell.viewWithTag(1006) as! UILabel
            let image1 = cell.viewWithTag(1002) as! UIImageView
            let image2 = cell.viewWithTag(1003) as! UIImageView
            let image3 = cell.viewWithTag(1004) as! UIImageView
            label1.text = "新来的多肉品种，你心中最好看的是哪个？"
            label2.text = "门卫大爷"
            label3.text = "166评论"
            image1.image = UIImage(named: "醉美人")
            image2.image = UIImage(named: "小人祭")
            image3.image = UIImage(named: "霜之朝")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassCell", for: indexPath)
            let label1 = cell.viewWithTag(1001) as! UILabel
            let label2 = cell.viewWithTag(1005) as! UILabel
            let label3 = cell.viewWithTag(1006) as! UILabel
            let image1 = cell.viewWithTag(1002) as! UIImageView
            let image2 = cell.viewWithTag(1003) as! UIImageView
            let image3 = cell.viewWithTag(1004) as! UIImageView
            label1.text = "3天破6亿，漫威新C位只能是他！"
            label2.text = "悠悠电影"
            label3.text = "1642评论"
            image1.image = UIImage(named: "蜘蛛侠1")
            image2.image = UIImage(named: "蜘蛛侠3")
            image3.image = UIImage(named: "蜘蛛侠2")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
}

