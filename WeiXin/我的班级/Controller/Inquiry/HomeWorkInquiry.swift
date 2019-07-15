//  HomeWorkInquiry.swift
//  WeiXin
//  Created by administrator on 2019/7/7.
//  Copyright © 2019 apple. All rights reserved.

import UIKit

class HomeWorkInquiry: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataSaver = DataSaver2()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        tableView.delegate = self
        tableView.dataSource = self
        dataSaver.loadDataFromPlist()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSaver.dataArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            let image = cell.viewWithTag(1000) as! UIImageView
            let label = cell.viewWithTag(1001) as! UILabel
            image.image = UIImage(named: "今日作业")
            label.text = "各科作业汇总"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            let button = cell.viewWithTag(1010) as! CircleButton
            let label1 = cell.viewWithTag(1011) as! UILabel
            let label2 = cell.viewWithTag(1012) as! UILabel
            let label3 = cell.viewWithTag(1013) as! UILabel
            let label4 = cell.viewWithTag(1014) as! UILabel
            let label5 = cell.viewWithTag(1015) as! UILabel
            button.setTitle("\(dataSaver.dataArr[indexPath.row - 1].lessonName)", for: .normal)
            label1.text = dataSaver.dataArr[indexPath.row - 1].text2
            label2.text = dataSaver.dataArr[indexPath.row - 1].teacherName
            label3.text = dataSaver.dataArr[indexPath.row - 1].text1
            label4.text = "开始时间：\(dataSaver.dataArr[indexPath.row - 1].text3)"
            label5.text = "截止时间：\(dataSaver.dataArr[indexPath.row - 1].text4)"
            return cell
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
}
