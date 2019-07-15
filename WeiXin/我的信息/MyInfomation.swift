//
//  MyInfomation.swift
//  WeiXin
//
//  Created by administrator on 6/26/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit

class MyInfomation: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArr = [
        ["今日心得"],
        ["个人收藏","个人设置"],
        ["周边","信息反馈"],
        ["退出登录"]
    ]
    var dataArr2 = [
        ["📔"],
        ["🕋","⚙️"],
        ["🏘","📮"],
        ["🚀"]
    ]
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // tableView.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        let label = cell.viewWithTag(1001) as! UILabel
        let button = cell.viewWithTag(1000) as! UIButton
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        let arr = dataArr[indexPath.section]
        let arr2 = dataArr2[indexPath.section]
        label.text = arr[indexPath.row]
        button.setTitle(arr2[indexPath.row], for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 3
    }
}

