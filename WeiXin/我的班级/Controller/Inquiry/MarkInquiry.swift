//  MarkInquiry.swift
//  WeiXin
//  Created by administrator on 2019/7/7.
//  Copyright © 2019 apple. All rights reserved.

import UIKit

class MarkInquiry: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSaver = DataSaver()
    var studentsNames = ["阿星","小雅","John","冰冰","雨诗","阿星","丹丹","Mike","小明","小花","小杰","小娟","小宇","小明","小花","小杰","小娟","小宇"]
    var images = ["男孩1","女孩5","男孩3","女孩2","女孩6","男孩2","女孩8","男孩3","男孩1","女孩9","男孩2","女孩6","女孩1","男孩2","女孩2","男孩3","女孩3","女孩1"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        tableView.delegate = self
        tableView.dataSource = self
        dataSaver.loadDataFromPlist()
        classNames = dataSaver.dataArr[0]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsNames.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let image = cell.viewWithTag(1000) as! UIImageView
            let label = cell.viewWithTag(1001) as! UILabel
            image.image = UIImage(named: "学生")
            label.text = "学生成绩查询"
            cell.accessoryType = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            let image = cell.viewWithTag(1002) as! UIImageView
            let label = cell.viewWithTag(1003) as! UILabel
            image.image = UIImage(named: images[indexPath.row-1])
            label.text = "\(studentsNames[indexPath.row-1])"
            return cell
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index  = tableView.indexPath(for: sender as! UITableViewCell) {
            let studentName = studentsNames[index.row - 1]
            let secondVC = segue.destination as! StudentsScore
            secondVC.studentName = studentName
        }
    }
}
