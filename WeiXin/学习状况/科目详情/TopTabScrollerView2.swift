//  File.swift
//  WeiXin
//  Created by administrator on 2019/7/8.
//  Copyright © 2019 apple. All rights reserved.


import UIKit

class TopTabScrollerView2: UIView, UIScrollViewDelegate{
    // 顶部菜单视图
    var line: UIView! // 线
    var topView: UIView! // 用于显示按钮
    var bigScrollerView: UIScrollView! // 内容视图
    var selectIndex: Int! // 当前选中试图标识
    var titleArray: [String]! // 视图名称列表
    var viewArray: [UIViewController]! // 视图列表
    // MARK:- 初始化函数
    // titleArray元素个数要与子试图数量匹配
    init(frame: CGRect, titleArray: [String], viewArray: [UIViewController]) {
        super.init(frame: frame)
        self.viewArray = viewArray
        self.selectIndex = 0
        self.titleArray = titleArray
        prepareTopUI()
        prepareScrollerViewUI()
    }
    
    // MARK:- UI视图实现
    // 顶部菜单栏视图
    func prepareTopUI() {
        // 选项底部的线
        line = UIView(frame: CGRect(x: 0, y: 49, width: kWidth / CGFloat(titleArray.count), height: 1))
        line.backgroundColor = UIColor.black
        // 顶部选项视图
        topView = UIView(frame: CGRect(x: 0, y: 0, width: kWidth, height: 50))
        topView.backgroundColor = UIColor.white
        
        // 顶部选项按钮
        for i in 0..<titleArray.count {
            let button = UIButton()
            button.frame = CGRect(x: kWidth / CGFloat(titleArray.count) * CGFloat(i), y: 0, width: kWidth / CGFloat(titleArray.count), height: 49)
            button.setTitle(titleArray[i], for: .normal)
            button.addTarget(self, action: #selector(buttonAction(button:)), for: .touchUpInside)
            button.tag = i
            topView.addSubview(button)
        }
        topView.addSubview(line)
        self.addSubview(topView)
        changeButtonTextColor()
    }
    
    // 内容视图
    func prepareScrollerViewUI() {
        bigScrollerView = UIScrollView(frame: CGRect(x: 0, y: 50, width: kWidth, height: self.frame.size.height - 50))
        bigScrollerView.contentSize = CGSize(width: kWidth * CGFloat(titleArray.count), height: self.frame.size.height - 50)
        bigScrollerView.delegate = self // 设置代理
        bigScrollerView.isScrollEnabled = true
        bigScrollerView.isPagingEnabled = true
        
        self.addSubview(bigScrollerView)
        
        // MARK: 以下为测试代码
        for i in 0..<viewArray.count {
            let view = viewArray[i]
            view.view.frame = CGRect(x: kWidth * CGFloat(i), y: 0, width: kWidth, height: kHeight - 64 - 50)
            bigScrollerView.addSubview(view.view)
        }
    }
    
    // MARK:- 点击菜单栏触发事件
    @objc func buttonAction(button: UIButton) {
        selectIndex = button.tag
        changeButtonTextColor()
        changeLinePlace(with: button.tag)
        changeScrollerViewPlace()
    }
    
    // MARK:- 试图切换时调用的函数
    // 改变滚动视图位置
    func changeScrollerViewPlace() {
        UIView.animate(withDuration: 0.5) {
            var offset = self.bigScrollerView.contentOffset
            offset.x = kWidth * CGFloat(self.selectIndex)
            self.bigScrollerView.contentOffset = offset
        }
    }
    
    // 改变选中字体的颜色
    func changeButtonTextColor() {
        for view in topView.subviews {
            guard view.isKind(of: UIButton.self) else {return}
            let button = view as! UIButton
            if button.tag == selectIndex {
                button.setTitleColor(UIColor.black, for: .normal)
            } else {
                button.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    // 改变line的位置
    func changeLinePlace(with index: Int) {
        UIView.animate(withDuration: 0.5) {
            var frame = self.line.frame
            frame.origin.x = kWidth / CGFloat(self.titleArray.count) * CGFloat(index)
            self.line.frame = frame
        }
    }
    
    // MARK:- UIScrollViewDelegate协议函数
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        selectIndex = Int(x / kWidth)
        changeButtonTextColor()
        changeLinePlace(with: selectIndex)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





























