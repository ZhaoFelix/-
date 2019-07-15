//
//  File.swift
//  WeiXin
//
//  Created by administrator on 2019/7/9.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = self.frame.width/2
    }
}
