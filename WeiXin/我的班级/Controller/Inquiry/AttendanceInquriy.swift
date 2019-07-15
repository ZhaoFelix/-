//  AttendanceInquriy.swift
//  WeiXin
//  Created by administrator on 2019/7/8.
//  Copyright © 2019 apple. All rights reserved.

import UIKit
import FSCalendar
class AttendanceInquriy: UIViewController,FSCalendarDelegate,FSCalendarDataSource,UITableViewDelegate,UITableViewDataSource {
    
    var dateDir = ["2019-07-01": 0, "2019-07-02": 2, "2019-07-03": 1, "2019-07-04": 3, "2019-07-05": 0, "2019-07-06": 2, "2019-07-07": 0, "2019-07-08": 1, "2019-07-09": 0, "2019-07-10": 0, "2019-07-11": 0, "2019-07-12": 0, "2019-07-13": 0, "2019-07-14": 0, "2019-07-15": 0, "2019-07-16": 0, "2019-07-17": 0, "2019-07-18": 0, "2019-07-19": 0, "2019-07-20": 0, "2019-07-21": 0, "2019-07-22": 0, "2019-07-23": 0, "2019-07-24": 0, "2019-07-25": 0, "2019-07-26": 0, "2019-07-27": 0, "2019-07-28": 0, "2019-07-29": 0, "2019-07-30": 0, "2019-07-31": 0]
    var studentsNumber = 25
    
    @IBOutlet weak var yingDaoRenShu: UILabel!
    @IBOutlet weak var shiDaoRenShu: UILabel!
    @IBOutlet weak var queQinRenShu: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var nameList:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 300))
        view.addSubview(calendar)
        calendar.delegate = self
        calendar.dataSource = self
        calendar.locale = Locale(identifier: "zh-CN")
        yingDaoRenShu.text = "应到：\(studentsNumber)人"
        navigationController?.navigationBar.shadowImage = UIImage()
        setTableView()
    }
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = nameList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        for (key, value) in dateDir {
            if date == string2Date(key) {
                queQinRenShu.text = "缺勤：\(value)人"
                shiDaoRenShu.text = "实到：\(studentsNumber - value)人"
                if value==1 {
                    nameList = ["阿星"]
                } else if value==2 {
                    nameList = ["小宝","雨诗"]
                } else if value==3 {
                    nameList = ["贝贝","小强","Mike"]
                } else if value == 0 {
                    nameList = [""]
                }
                tableView.reloadData()
            }
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        for (key, value) in dateDir {
            if date == string2Date(key) {
                if value != 0 {
                    calendar.appearance.eventDefaultColor = .red
                    queQinRenShu.text = "缺勤：\(value)人"
                    shiDaoRenShu.text = "实到：\(studentsNumber - value)人"
                    return 1
                } else {
                    return 0
                }
            } else {
                continue
            }
        }
        return 0
    }
    
    //字符串转日期
    func string2Date(_ string:String, dateFormat:String = "yyyy-MM-dd") -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: string)
        return date!
    }
    
    //日期转字符串
    func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: date)
        return date
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
}
