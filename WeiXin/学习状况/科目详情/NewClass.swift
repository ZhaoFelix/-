//
//  NewClass.swift
//  WeiXin
//
//  Created by administrator on 6/29/19.
//  Copyright © 2019 apple. All rights reserved.
//
import UIKit
import AipOcrSdk
protocol NewClassDelegate:class {
    func NewClassAdd(controller:NewClass, cellName:String, teacherName: String, gradeName: String, studyTime: String)
}

class NewClass: UIViewController,UITextFieldDelegate,UIAlertViewDelegate {
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var doneItem: UIBarButtonItem!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var wArr = ""
    var delegate:NewClassDelegate?
    var cellName: String?
    override func viewDidLoad() {
        navigationController?.navigationBar.shadowImage = UIImage()
          AipOcrService.shard()?.auth(withAK: "vX5HaXAxLN9b38KFvrY0f8eT", andSK: "RSHoMdjO1eP3pfGtxccxHETWvZcUjYj5")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func textOCR(_ sender: UIButton) {
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
            descriptionTextView.text = ""
            descriptionTextView.text = wArr
            wArr = ""
        }
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        let text = textFiled.text ?? ""
        let text1 = textField1.text ?? ""
        let text2 = textField2.text ?? ""
        let text3 = textField3.text ?? ""
        if text != "" {
            delegate?.NewClassAdd(controller: self, cellName: text, teacherName: text1, gradeName: text2, studyTime: text3)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textFiled.resignFirstResponder()
    }
}
