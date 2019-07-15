//  SecondTableView.swift
//  WeiXin
//  Created by administrator on 7/4/19.
//  Copyright © 2019 apple. All rights reserved.

import UIKit

class SecondTableView: UITableViewController {
    
    var dic: [String :String]!
    var names:[String:[String]] = ["0":["新建联系人"], "1": ["讨论组"], "2": ["教师"], "3": ["家长"], "4": ["学生"],"5":["🌺秀秀🍎","Doctor Strange","华山首徒令狐冲","😖 亿锡房...","Toney Stack","绿竹巷的绿竹翁","Steve Rogers","简简单单","张韶勋"],"6":["Z.Y.Y","God of Thunder","Natasha Romanov"]]
    var images:[String:[String]] = ["0":["新建联系人"], "1": ["讨论组"], "2":["教师"], "3": ["家长"], "4": ["学生"],"5": ["🌺秀秀🍎","img7","帅哥","😖 亿锡房...","img","福猪","img1","简简单单","张韶勋"], "6": ["Z.Y.Y","img2","img4"]]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names["\(section)"]!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        } else {
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell1", for: indexPath)
            let label = cell.viewWithTag(3000) as! UILabel
            let image = cell.viewWithTag(1000) as! UIImageView
            let arr = names["\(indexPath.section)"]
            let arr1 = images["\(indexPath.section)"]
            label.text = arr![indexPath.row]
            image.image = UIImage(named: arr1![indexPath.row])
            return cell
        } else if indexPath.section <= 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell2", for: indexPath)
            let label = cell.viewWithTag(1011) as! UILabel
            let image = cell.viewWithTag(1010) as! UIImageView
            let label1 = cell.viewWithTag(1012) as! UILabel
            let arr1 = images["\(indexPath.section)"]
            let arr = names["\(indexPath.section)"]
            label.text = arr![indexPath.row]
            label1.text = String(Int.random(in: 5...30))
            image.image = UIImage(named: arr1![indexPath.row])
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell1", for: indexPath)
            let label = cell.viewWithTag(3000) as! UILabel
            let image = cell.viewWithTag(1000) as! UIImageView
            let arr = names["\(indexPath.section)"]
            let arr1 = images["\(indexPath.section)"]
            label.text = arr![indexPath.row]
            image.image = UIImage(named: arr1![indexPath.row])
            return cell
        }
    }
}
