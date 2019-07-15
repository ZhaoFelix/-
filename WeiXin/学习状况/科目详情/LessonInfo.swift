//
//  LessonInfo.swift
//  WeiXin
//
//  Created by administrator on 2019/7/8.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import WebKit
class LessonInfo: UIViewController {
    var lessonName = ""
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        lessonName = lessonNm
        super.viewDidLoad()
        if lessonName == "语文" {
            let filePath = Bundle.main.path(forResource: "语文", ofType: "pdf")
            let data = FileManager.default.contents(atPath: filePath!)
            webView.load(data!, mimeType: "application/pdf", characterEncodingName: "UTF-8", baseURL: URL(fileURLWithPath: filePath!))
        } else if lessonName == "数学" {
            let filePath = Bundle.main.path(forResource: "数学", ofType: "pdf")
            let data = FileManager.default.contents(atPath: filePath!)
            webView.load(data!, mimeType: "application/pdf", characterEncodingName: "UTF-8", baseURL: URL(fileURLWithPath: filePath!))
        } else {
            let filePath = Bundle.main.path(forResource: "语文", ofType: "pdf")
            let data = FileManager.default.contents(atPath: filePath!)
            webView.load(data!, mimeType: "application/pdf", characterEncodingName: "UTF-8", baseURL: URL(fileURLWithPath: filePath!))
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }


}
