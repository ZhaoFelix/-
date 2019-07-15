//
//  FirstTableView.swift
//  WeiXin
//
//  Created by administrator on 7/4/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class FirstTableView: UITableViewController {

    var names = ["🌺秀秀🍎","华山首徒令狐冲","😖 亿锡房...","Toney Stack","绿竹巷的绿竹翁","简简单单","张韶勋","Z.Y.Y","God of Thunder","Natasha Romanov"]
    var images = ["🌺秀秀🍎","帅哥","😖 亿锡房...","img","福猪","简简单单","张韶勋", "Z.Y.Y","img2","img4"]
    var label2s = ["Welcome to Revegers!","I can do it all day!","谢谢！","暑假快乐！","你好！","人生若只如初见。。。"]
    var label3s = ["一周前","两周前","两周前","两周前","三周前","三周前","三周前"]
    var label4s = ["","❤︎","","","❤︎",""]
    var dataArr: [CellInfomation] = []
    required init?(coder aDecoder: NSCoder) {
        let cellInfo1 = CellInfomation()
        cellInfo1.label1 = "Toney Stack"
        cellInfo1.label2 = "Welcome to Revegers!"
        cellInfo1.label3 = "16分钟前"
        cellInfo1.label4 = "❤︎"
        cellInfo1.image = "img"
        dataArr.append(cellInfo1)
        
        let cellInfo2 = CellInfomation()
        cellInfo2.label1 = "Steve Rogers"
        cellInfo2.label2 = "I can do it all day!"
        cellInfo2.label3 = "3小时前"
        cellInfo2.label4 = "❤︎"
        cellInfo2.image = "img1"
        dataArr.append(cellInfo2)
        
        let cellInfo3 = CellInfomation()
        cellInfo3.label1 = "God of Thunder"
        cellInfo3.label2 = "I am God of Thunder!"
        cellInfo3.label3 = "昨天"
        cellInfo3.label4 = "❤︎"
        cellInfo3.image = "img2"
        dataArr.append(cellInfo3)
        
        let cellInfo4 = CellInfomation()
        cellInfo4.label1 = "Hulk"
        cellInfo4.label2 = "Thor go, Hulk stay!"
        cellInfo4.label3 = "昨天"
        cellInfo4.label4 = " "
        cellInfo4.image = "img3"
        dataArr.append(cellInfo4)
        
        let cellInfo5 = CellInfomation()
        cellInfo5.label1 = "Natasha Romanov"
        cellInfo5.label2 = "Sun is real low..."
        cellInfo5.label3 = "前天"
        cellInfo5.label4 = "❤︎"
        cellInfo5.image = "img4"
        dataArr.append(cellInfo5)
        
        let cellInfo6 = CellInfomation()
        cellInfo6.label1 = "Peter Park"
        cellInfo6.label2 = "I am sorry,Mr. Stark."
        cellInfo6.label3 = "星期二"
        cellInfo6.label4 = " "
        cellInfo6.image = "img5"
        dataArr.append(cellInfo6)
        
        let cellInfo7 = CellInfomation()
        cellInfo7.label1 = "Clint Kent"
        cellInfo7.label2 = "Don't call me wake."
        cellInfo7.label3 = "星期二"
        cellInfo7.label4 = "❤︎"
        cellInfo7.image = "img6"
        dataArr.append(cellInfo7)
        
        let cellInfo8 = CellInfomation()
        cellInfo8.label1 = "Doctor Strange"
        cellInfo8.label2 = "I'm here to negotiate!"
        cellInfo8.label3 = "星期一"
        cellInfo8.label4 = "❤︎"
        cellInfo8.image = "img7"
        dataArr.append(cellInfo8)
        
        let cellInfo9 = CellInfomation()
        cellInfo9.label1 = "Peter Qurel"
        cellInfo9.label2 = "You shouldn't kill her!"
        cellInfo9.label3 = "一周前"
        cellInfo9.label4 = "❤︎"
        cellInfo9.image = "img8"
        dataArr.append(cellInfo9)
        
        let cellInfo10 = CellInfomation()
        cellInfo10.label1 = "Locki"
        cellInfo10.label2 = "You will never be a God!"
        cellInfo10.label3 = "上个月"
        cellInfo10.label4 = " "
        cellInfo10.image = "img9"
        dataArr.append(cellInfo10)
        
        for i in 0..<names.count {
            let cellInfo11 = CellInfomation()
            cellInfo11.label1 = names[i]
            cellInfo11.label2 = label2s[i%label2s.count]
            cellInfo11.label3 = label3s[i%label3s.count]
            cellInfo11.label4 = label4s[i%label4s.count]
            cellInfo11.image = images[i%images.count]
            dataArr.append(cellInfo11)
        }
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == dataArr.count  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TalkTask3", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TalkTask2", for: indexPath)
            let label1 = cell.viewWithTag(1001) as! UILabel
            let label2 = cell.viewWithTag(1002) as! UILabel
            let label3 = cell.viewWithTag(1003) as! UILabel
            let label4 = cell.viewWithTag(1004) as! UILabel
            let image = cell.viewWithTag(1008) as! UIImageView
            let cellInfo = dataArr[indexPath.row]
            label1.text = cellInfo.label1
            label2.text = cellInfo.label2
            label3.text = cellInfo.label3
            label4.text = cellInfo.label4
            image.image = UIImage(named: cellInfo.image)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else if indexPath.row == dataArr.count {
            return 250
        }
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count+1
    }
}
