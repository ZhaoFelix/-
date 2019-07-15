//
//  StudentsScore.swift
//  WeiXin
//
//  Created by administrator on 2019/7/10.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Charts

class StudentsScore: UIViewController {

    @IBOutlet weak var chartView: BarChartView!
    var studentName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setChartView()
       
    }
    func setChartView(){
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<6 {
            let y = Int.random(in: 50...100)
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "\(studentName)个人成绩")
        chartDataSet.colors = [.orange]
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        let xValues = ["语文","英语","化学","物理","数学","科学"]
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xValues)
        //设置柱状图数据
        chartView.data = chartData
        chartView.fitScreen()
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.xAxis.labelPosition = .bottom
    }

   
}
