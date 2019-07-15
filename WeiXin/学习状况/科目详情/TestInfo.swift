//
//  TestInfo.swift
//  WeiXin
//
//  Created by administrator on 2019/7/9.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Charts
class TestInfo: UIViewController {
     @IBOutlet weak var pieView: PieChartView!
     @IBOutlet weak var chartView: LineChartView!
     var dic = ["80~100":6,"60~80":17,"0~60":2]
   override func viewDidLoad() {
        super.viewDidLoad()
        setChartView()
        setLineChartView()
    }
    
    func setChartView() {
        let  dataEntries = dic.map { (item) -> PieChartDataEntry in
            return PieChartDataEntry(value: Double(item.value),label: item.key)
        }
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        //设置颜色
        chartDataSet.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
        
        // chartDataSet.xValuePosition = .insideSlice //标签显示在内
        chartDataSet.yValuePosition = .outsideSlice //数值显示在外
        chartDataSet.selectionShift = 5
        chartDataSet.sliceSpace = 2
        let chartData = PieChartData(dataSet: chartDataSet)
        chartData.setValueTextColor(.black)//文字颜色为黑色
        let formatter = NumberFormatter()  //自定义格式
        formatter.positiveSuffix = "人"  //数字前缀单位
        chartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        //设置饼状图数据
        pieView.data = chartData
        pieView.chartDescription?.text = "本次考试汇总"
    }
    
    func setLineChartView(){
//        //创建折线图组件对象
//        let chartView = LineChartView()
//        chartView.frame = CGRect(x: 0, y: 300, width: self.view.bounds.width,
//                                 height: 300)
//        view.addSubview(chartView)
        //生成第一条折线数据
        var dataEntries1 = [ChartDataEntry]()
        for i in 0..<8 {
            let y = Double.random(in: 65...85)
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries1.append(entry)
        }
        let chartDataSet1 = LineChartDataSet(entries: dataEntries1, label: "\(lessonNm)")
        chartDataSet1.drawCirclesEnabled = false
        
        
        //生成第二条折线数据
//        var dataEntries2 = [ChartDataEntry]()
//        for i in 0..<8 {
//            let y = arc4random()%100
//            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
//            dataEntries2.append(entry)
//        }
//        let chartDataSet2 = LineChartDataSet(entries: dataEntries2, label: "月考2")
//        chartDataSet2.drawCirclesEnabled  = false
        //chartDataSet2.colors = [.orange]
        //目前折线图包括2根折线
        //let chartData = LineChartData(dataSets: [chartDataSet1, chartDataSet2])
        let chartData = LineChartData(dataSets: [chartDataSet1])
        let xValues = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月"]
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xValues)
        
        //设置折现图数据
        chartView.data = chartData
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelHeight = 2
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawLimitLinesBehindDataEnabled = true
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.rightAxis.enabled = true
        //chartView.leftAxis.granularity = 10
        chartView.leftAxis.axisMaximum = 100
        chartView.leftAxis.axisMinimum = 0
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawZeroLineEnabled = true
        chartView.chartDescription?.text = "每月考试平均成绩走势"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
}
