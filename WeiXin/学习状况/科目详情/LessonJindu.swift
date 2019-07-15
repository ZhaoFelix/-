//
//  LessonJindu.swift
//  WeiXin
//
//  Created by administrator on 2019/7/8.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Charts
import ZZCircleProgress

class LessonJindu: UIViewController {

    var dataSaver = DataSaver()
    @IBOutlet weak var circleProgress: ZZCircleProgress!
    @IBOutlet weak var studyTime: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSaver.loadDataFromPlist()
        var arr = dataSaver.dataArr[3]
        var arr2 = studyTms
//        arr.reverse()
//        arr2.reverse()
        totalTime.text = arr[classIndex]
        studyTime.text = "\(arr2[classIndex])"
        setCircleProgress()
    }
    
    func setCircleProgress(){
        circleProgress.pathBackColor = .init(displayP3Red: 72/255, green: 194/255, blue: 168/255, alpha: 1.0)
        circleProgress.pathFillColor = .init(displayP3Red: 255/255, green: 218/255, blue: 68/255, alpha: 1.0)
        circleProgress.reduceAngle = 60
        circleProgress.startAngle = 120
        circleProgress.duration = 2.0
        if let fir = Double(totalTime.text!) {
            if let sec = Double(studyTime.text!) {
                circleProgress.progress = CGFloat(sec / fir)
            } else {
                circleProgress.progress = 60/100
            }
        } else {
            circleProgress.progress = 60/100
        }
        circleProgress.strokeWidth = 30
        circleProgress.progressLabel.textColor = .init(displayP3Red: 255/255, green: 218/255, blue: 68/255, alpha: 1.0)
        circleProgress.progressLabel.font = UIFont.systemFont(ofSize: 50)
        circleProgress.increaseFromLast = true
        circleProgress.showPoint = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }


}
