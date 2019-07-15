//  NewHomeWork.swift
//  WeiXin
//  Created by administrator on 2019/7/9.
//  Copyright © 2019 apple. All rights reserved.

import UIKit

class HomeWork: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSaver = DataSaver2()
    var homeWork:[LessonMessage] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        tableView.delegate = self
        tableView.dataSource = self
//        dataSaver.loadDataFromPlist()
//        for i in 0..<dataSaver.dataArr.count {
//            if dataSaver.dataArr[i].lessonName == lessonNm {
//                homeWork.append(dataSaver.dataArr[i])
//            }
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeWork.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            let image = cell.viewWithTag(1000) as! UIImageView
            let label = cell.viewWithTag(1001) as! UILabel
            image.image = UIImage(named: "今日作业")
            label.text = "\(lessonNm)作业"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            let button = cell.viewWithTag(1010) as! CircleButton
            let label1 = cell.viewWithTag(1011) as! UILabel
            let label2 = cell.viewWithTag(1012) as! UILabel
            let label3 = cell.viewWithTag(1013) as! UILabel
            let label4 = cell.viewWithTag(1014) as! UILabel
            let label5 = cell.viewWithTag(1015) as! UILabel
            button.setTitle("\(homeWork[indexPath.row - 1].lessonName)", for: .normal)
            label1.text = homeWork[indexPath.row - 1].text2
            label2.text = homeWork[indexPath.row - 1].teacherName
            label3.text = homeWork[indexPath.row - 1].text1
            label4.text = "开始时间：\(homeWork[indexPath.row - 1].text3)"
            label5.text = "截止时间：\(homeWork[indexPath.row - 1].text4)"
            return cell
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
}
