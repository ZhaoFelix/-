//  ClassStatus.swift
//  WeiXin
//  Created by administrator on 6/29/19.
//  Copyright © 2019 apple. All rights reserved.

import UIKit
public var lessonNm = ""
public var teacherNm = ""
public var classIndex = 0
class ClassStatus: UIViewController{
    
    var className = ""
    var teacherName = ""
    var row = 0
    var topTabScrollerView: TopTabScrollerView2! // 菜单栏容器视图
    var firstView = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "LessonJindu") as! LessonJindu
    var secondView = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "LessonInfo") as! LessonInfo
    var thirdView = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "TestInfo") as! TestInfo
    var forthView = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "HomeWork") as! HomeWork
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = className
        lessonNm = className
        teacherNm = teacherName
        classIndex = row
        prepareUI()
    }
    
    func prepareUI() {
        topTabScrollerView = TopTabScrollerView2(frame: CGRect(x: 0, y: 94, width: kWidth, height: kHeight - 64) , titleArray: ["课程进度","课程内容", "考试汇总", "作业"], viewArray: [firstView, secondView, thirdView, forthView])
        self.view.addSubview(topTabScrollerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        forthView.homeWork = []
        forthView.dataSaver.loadDataFromPlist()
        for i in 0..<forthView.dataSaver.dataArr.count {
            if forthView.dataSaver.dataArr[i].lessonName == lessonNm {
                forthView.homeWork.append(forthView.dataSaver.dataArr[i])
            }
        }
        forthView.tableView.reloadData()
    }
}
