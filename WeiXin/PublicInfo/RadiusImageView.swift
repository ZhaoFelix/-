//
//  RadiusImageView.swift
//  WeiXin
//
//  Created by administrator on 7/4/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class RadiusImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        self.layer.cornerRadius = self.frame.width/6
    }
}
