//  ViewController.swift
//  WeiXin
//  Created by apple on 2019/6/25.
//  Copyright © 2019 apple. All rights reserved.

import UIKit
class MyFriends: UIViewController{
   
    var topTabScrollerView: TopTabScrollerView! // 菜单栏容器视图
    var firstView = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "First") as! FirstTableView
    var secondView = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Second") as! SecondTableView
    var thirdView = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Third") as! ThirdTableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI() {
        topTabScrollerView = TopTabScrollerView(frame: CGRect(x: 0, y: 44, width: kWidth, height: kHeight - 64) , titleArray: ["消息", "通讯录", "校圈"], viewArray: [firstView, secondView, thirdView])
        self.view.addSubview(topTabScrollerView)
    }
}
