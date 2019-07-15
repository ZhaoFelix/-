//
//  DataSaver.swift
//  WeiXin
//
//  Created by administrator on 6/30/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
//数据读写类
class DataSaver {
    var dataArr: [[String]] = [[],[],[],[],[]]
   
    //获取文件目录
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    //获取数据的存储路径
    func dataFilePath() -> URL {
        return getDocumentDirectory().appendingPathComponent("DataSaver.plist")
    }
    
    //将数据写入plist文件
    func saveDataToPlist(){
        let encoder = PropertyListEncoder() //创建一个编码器
        do {
            //存储过程
            let data = try encoder.encode(dataArr)
            try data.write(to: dataFilePath())
        }
        catch {
            //存储出错时调用这部分
            print("写入数据失败")
        }
    }
    
    func loadDataFromPlist(){
        let path = dataFilePath()  //plist的文件路径
        //判断是否成功获取数据，data != nil
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder() //解码器
            do {
                dataArr = try decoder.decode([[String]].self, from: data)
            }
            catch {
                print("读数据失败")
            }
        }
    }
}

