//
//  ThirdTableView.swift
//  WeiXin
//
//  Created by administrator on 7/4/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
class ThirdTableView: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cellOfThirdTableView")
        tableView.register(UINib(nibName: "MyClassCell", bundle: nil), forCellReuseIdentifier: "MyClassCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfThirdTableView", for: indexPath)
            let label1 = cell.viewWithTag(3001) as! UILabel
            let label2 = cell.viewWithTag(3002) as! UILabel
            let label3 = cell.viewWithTag(3003) as! UILabel
            let image4 = cell.viewWithTag(3004) as! UIImageView
            let label6 = cell.viewWithTag(3006) as! UILabel
            let label8 = cell.viewWithTag(3008) as! UILabel
            let image10 = cell.viewWithTag(3000) as! UIImageView
            let label0 = cell.viewWithTag(2999) as! UILabel
            label0.text = "意大利军队的战斗力究竟如何？"
            label1.text = "丁香医生"
            label2.text = "16分钟前"
            label3.text = "关于意大利军的战斗力，排名第一的那个辟谣贴在知乎上被转了五次。然而这个辟谣贴和造谣帖毫无区别，很有点周带鱼大战袁腾飞的感觉"
            label6.text = "665"
            label8.text = "218"
            image4.image = UIImage(named: "意大利国旗")
            image10.image = UIImage(named: "小白兔")
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfThirdTableView", for: indexPath)
            let label1 = cell.viewWithTag(3001) as! UILabel
            let label2 = cell.viewWithTag(3002) as! UILabel
            let label3 = cell.viewWithTag(3003) as! UILabel
            let image4 = cell.viewWithTag(3004) as! UIImageView
            let label6 = cell.viewWithTag(3006) as! UILabel
            let label8 = cell.viewWithTag(3008) as! UILabel
            let image10 = cell.viewWithTag(3000) as! UIImageView
            let label0 = cell.viewWithTag(2999) as! UILabel
            label0.text = "世界杯上穿什么服装？"
            label1.text = "张三"
            label2.text = "53分钟前"
            label3.text = "本来有一个很简单的办法解决这个问题。那就是数数世界杯赛场的观众席上，是穿旗袍的观众多，还是穿汉服的观众多……以别的国家为例：韩国人真的会穿韩服去看世界杯……墨西哥和巴拿马戴一个大草帽就行了，神韵全出。墨西哥人有时候还会伪装成阿兹特克人…"
            label6.text = "1503"
            label8.text = "453"
            image4.image = UIImage(named: "cell2")
            image10.image = UIImage(named: "cell1")
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassCell", for: indexPath)
            let label1 = cell.viewWithTag(1001) as! UILabel
            let label2 = cell.viewWithTag(1005) as! UILabel
            let label3 = cell.viewWithTag(1006) as! UILabel
            let image1 = cell.viewWithTag(1002) as! UIImageView
            let image2 = cell.viewWithTag(1003) as! UIImageView
            let image3 = cell.viewWithTag(1004) as! UIImageView
            label1.text = "新来的多肉品种，你心中最好看的是哪个？"
            label2.text = "门卫大爷"
            label3.text = "166评论"
            image1.image = UIImage(named: "醉美人")
            image2.image = UIImage(named: "小人祭")
            image3.image = UIImage(named: "霜之朝")
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfThirdTableView", for: indexPath)
            let label1 = cell.viewWithTag(3001) as! UILabel
            let label2 = cell.viewWithTag(3002) as! UILabel
            let label3 = cell.viewWithTag(3003) as! UILabel
            let image4 = cell.viewWithTag(3004) as! UIImageView
            let label6 = cell.viewWithTag(3006) as! UILabel
            let label8 = cell.viewWithTag(3008) as! UILabel
            let image10 = cell.viewWithTag(3000) as! UIImageView
            let label0 = cell.viewWithTag(2999) as! UILabel
            label0.text = "如何才能设计出好的校园？"
            label1.text = "Hope Chen"
            label2.text = "53分钟前"
            label3.text = "幼儿园，小学，中学，大学，不同种类的校园，它们的差别很大，很难通过一题提问，这样也很难做答。这个问题很久之前提出的，大部分回答者的答题时间也很早。"
            label6.text = "1206"
            label8.text = "88"
            image4.image = UIImage(named: "校园规划")
            image10.image = UIImage(named: "皮卡丘")
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfThirdTableView", for: indexPath)
            let label1 = cell.viewWithTag(3001) as! UILabel
            let label2 = cell.viewWithTag(3002) as! UILabel
            let label3 = cell.viewWithTag(3003) as! UILabel
            let image4 = cell.viewWithTag(3004) as! UIImageView
            let label6 = cell.viewWithTag(3006) as! UILabel
            let label8 = cell.viewWithTag(3008) as! UILabel
            let image10 = cell.viewWithTag(3000) as! UIImageView
            let label0 = cell.viewWithTag(2999) as! UILabel
            label0.text = "如何把校园拍的好看？"
            label1.text = "clarkyu"
            label2.text = "一天前"
            label3.text = "首先，要选对季节。比如在我们学校，秋天和冬天比较美，秋天的红叶和冬天的雪很上镜，那就趁这两个季节，多拍些图。比如武大樱花很美，那就趁着有花的时候多拍。"
            label6.text = "562"
            label8.text = "98"
            image4.image = UIImage(named: "校园图片")
            image10.image = UIImage(named: "手绘图像")
            return cell
        }  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfThirdTableView", for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
