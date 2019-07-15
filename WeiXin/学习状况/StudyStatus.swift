//
//  StudyStatus.swift
//  WeiXin
//
//  Created by administrator on 6/29/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
public var classNames: [String] = []
public var studyTms: [String] = []
class StudyStatus: UITableViewController,NewClassDelegate,UITextFieldDelegate {
    var cellNames: [String] = []
    var teacherNames: [String] = []
    var gradeNames: [String] = []
    var studyTimes: [String] = []
    var dataSaver = DataSaver()
    var lessonNames = ["语文","数学","英语","美术","物理","科学探索"]
    var isAppend = false
    func NewClassAdd(controller: NewClass, cellName: String, teacherName: String, gradeName: String, studyTime: String) {
        let index = cellNames.count
        isAppend = true
        cellNames.append(cellName)
        teacherNames.append(teacherName)
        gradeNames.append(gradeName)
        studyTimes.append(studyTime)
        classNames = cellNames
        let indexPath = IndexPath(row: index, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        navigationController?.popViewController(animated: true)
        
        dataSaver.dataArr[0] = cellNames
        dataSaver.dataArr[1] = teacherNames
        dataSaver.dataArr[2] = gradeNames
        dataSaver.dataArr[3] = studyTimes
        dataSaver.saveDataToPlist()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor =
            UIColor(red: 42/255, green: 185/255, blue: 155/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        tableView.separatorStyle = .none
        
        dataSaver.loadDataFromPlist()
        cellNames = dataSaver.dataArr[0]
        teacherNames = dataSaver.dataArr[1]
        gradeNames = dataSaver.dataArr[2]
        studyTimes = dataSaver.dataArr[3]
        classNames = cellNames
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNames.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == cellNames.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfStudyStatus1", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfStudyStatus", for: indexPath)
            let label1 = cell.viewWithTag(2000) as! UILabel
            let label2 = cell.viewWithTag(2001) as! UILabel
            let label3 = cell.viewWithTag(2002) as! UILabel
            let label4 = cell.viewWithTag(2003) as! UILabel
            let label5 = cell.viewWithTag(1998) as! UILabel
            let image = cell.viewWithTag(1999) as! UIImageView
            let rand = Int.random(in: 1...20)
            for i in lessonNames {
                if i == cellNames[indexPath.row] {
                    image.image = UIImage(named: i)
                }
            }
            if image.image == nil {
                image.image = UIImage(named: "科学")
            }
            label1.text = cellNames[indexPath.row]
            label3.text = teacherNames[indexPath.row]
            label2.text = gradeNames[indexPath.row]
            label4.text = "\(studyTimes[indexPath.row])课时"
            if isAppend {
                label5.text = "0课时/"
                studyTms.append("0")
                isAppend = false
            } else {
                label5.text = "\(rand)课时/"
                studyTms.append("\(rand)")
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row == cellNames.count {
            return 
        }
        cellNames.remove(at: indexPath.row)
        teacherNames.remove(at: indexPath.row)
        gradeNames.remove(at: indexPath.row)
        studyTimes.remove(at: indexPath.row)
        studyTms.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        classNames = cellNames
        dataSaver.dataArr[0] = cellNames
        dataSaver.dataArr[2] = gradeNames
        dataSaver.dataArr[1] = teacherNames
        dataSaver.dataArr[3] = studyTimes
        dataSaver.saveDataToPlist()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == cellNames.count {
            return 640
        } else {
        return 120
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showClass" {
            if let index  = tableView.indexPath(for: sender as! UITableViewCell) {
                let className = cellNames[index.row]
                let teacherName = teacherNames[index.row]
                let row = index.row
                let secondVC = segue.destination as! ClassStatus
                secondVC.className = className
                secondVC.teacherName = teacherName
                secondVC.row = row
            }
            return
        } else {
            let secondVC = segue.destination as! NewClass
            secondVC.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
}



