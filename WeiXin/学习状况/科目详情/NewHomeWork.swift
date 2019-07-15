//  HomeWork.swift
//  WeiXin
//  Created by administrator on 2019/7/6.
//  Copyright © 2019 apple. All rights reserved.

import UIKit
import AipOcrSdk
class NewHomeWork: UIViewController, UIAlertViewDelegate  {
    var dataSaver = DataSaver2()
    var lessonMessage = LessonMessage()
    var wArr = ""
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBAction func homeWorkButton(_ sender: RadiusButton) {
        lessonMessage.text1 = text.text!
        lessonMessage.text2 = textField2.text!
        lessonMessage.text3 = textField3.text!
        lessonMessage.text4 = textField4.text!
        lessonMessage.lessonName = lessonNm
        lessonMessage.teacherName = teacherNm
        dataSaver.dataArr.append(lessonMessage)
        dataSaver.saveDataToPlist()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func ARButton(_ sender: UIButton) {
        let vc = AipGeneralVC.viewController { (image) in
            let dic = ["language_type":"CHN_ENG", "detect_direction":"true"]
            AipOcrService.shard()?.detectText(from: image, withOptions: dic, successHandler: { (result) in
                let dic = result as! [String:Any]
                let wordArr = dic["words_result"] as! [Any]
                for word in wordArr {
                    let wordDic = word as! [String:Any]
                    //self.wArr.append(wordDic["words"] as! String)
                    self.wArr += wordDic["words"] as! String
                }
                DispatchQueue.main.async {
                    let alertView = UIAlertView(title: "识别结果", message: self.wArr, delegate: self , cancelButtonTitle: "取消", otherButtonTitles: "确定")
                    alertView.show()
                }
            }, failHandler: { (error) in
                print(error)
            })
        }
        self.present(vc!, animated: true, completion: nil)
        
        
    }
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        self.dismiss(animated: true, completion: nil)
        if buttonIndex == 1 {
            text.text = ""
            text.text = wArr
            wArr = ""
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        title = "\(lessonNm)作业发布"
        AipOcrService.shard()?.auth(withAK: "vX5HaXAxLN9b38KFvrY0f8eT", andSK: "RSHoMdjO1eP3pfGtxccxHETWvZcUjYj5")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textField4.resignFirstResponder()
        text.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
}
