//
//  WelcomeToTA.swift
//  WeiXin
//
//  Created by administrator on 6/29/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class WelcomeToTA: UIViewController {

    var timer:Timer!
    
//    @IBAction func TiaoZhuan(_ sender: UIButton) {
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (time) in
            
            //TODO:-self.TiaoZhuan()
            self.timer.invalidate()
        })
        
    }
    

    // MARK: - Navigation


}
