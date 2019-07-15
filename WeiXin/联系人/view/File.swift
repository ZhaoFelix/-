//
//  File.swift
//  WeiXin
//
//  Created by administrator on 2019/7/7.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class backgroundButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //设置圆角
        self.layer.cornerRadius = self.frame.height/4
        //显示圆角
        self.layer.masksToBounds = true
        //保持不变型
        self.imageView?.contentMode = .scaleToFill
    }
}
