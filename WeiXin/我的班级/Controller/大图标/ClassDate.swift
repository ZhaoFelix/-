//
//  ClassDate.swift
//  WeiXin
//
//  Created by administrator on 2019/7/7.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ClassDate: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }

}
