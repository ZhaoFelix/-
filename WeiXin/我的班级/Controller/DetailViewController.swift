//
//  DetailViewController.swift
//  WeiXin
//
//  Created by Felix on 2019/7/10.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController,WKUIDelegate,WKNavigationDelegate {

    var progressView = UIProgressView()
    var webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let url = URL(string: "http://www.brs.edu.cn/29435.html")
        webView = WKWebView(frame: CGRect(x: 0, y: -40, width: view.frame.width, height: view.frame.height))
        view.addSubview(webView)
        webView.load(URLRequest(url: url!))
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        //网页的加载进度条
        progressView = UIProgressView(frame: CGRect(x: 0, y: 44-2, width: UIScreen.main.bounds.size.width, height: 3))
        progressView.trackTintColor = UIColor.white
        progressView.progressTintColor = UIColor(red: 69/255.0, green: 121/255.0, blue: 251/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.addSubview(progressView)
        
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView.isHidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            
        }
    }
    //网页加载完成时调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    


}
