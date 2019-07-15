//
//  AppDelegate.swift
//  WeiXin
//
//  Created by apple on 2019/6/25.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let manager = RescouceManager.share
        manager.musicName = "岁月神偷"
        if manager.boxImages.count == 0 {
            manager.addBoxImage(image: UIImage(named: "s_1")!)
            manager.addBoxImage(image: UIImage(named: "s_2")!)
            manager.addBoxImage(image: UIImage(named: "s_3")!)
            manager.addBoxImage(image: UIImage(named: "s_4")!)
            manager.addBoxImage(image: UIImage(named: "s_5")!)
            manager.addBoxImage(image: UIImage(named: "s_6")!)
            manager.addBoxImage(image: UIImage(named: "s_7")!)
            manager.addBoxImage(image: UIImage(named: "s_8")!)
            manager.addBoxImage(image: UIImage(named: "s_9")!)
        }
        if manager.verticalImages.count == 0 {
            manager.addVerticalImage(image: UIImage(named: "v_1")!)
            manager.addVerticalImage(image: UIImage(named: "v_2")!)
            manager.addVerticalImage(image: UIImage(named: "v_3")!)
            manager.addVerticalImage(image: UIImage(named: "v_4")!)
            manager.addVerticalImage(image: UIImage(named: "v_5")!)
        }
        if manager.horizontalImages.count == 0 {
            manager.addHorizontalImage(image: UIImage(named: "h_1")!)
            manager.addHorizontalImage(image: UIImage(named: "h_2")!)
            manager.addHorizontalImage(image: UIImage(named: "h_3")!)
            manager.addHorizontalImage(image: UIImage(named: "h_4")!)
            manager.addHorizontalImage(image: UIImage(named: "h_5")!)
            manager.addHorizontalImage(image: UIImage(named: "h_6")!)
            manager.addHorizontalImage(image: UIImage(named: "h_7")!)
        }
        if manager.text == nil {
            if  manager.text?.count == 0 {
                manager.text = "嗨,你好呀!"
                manager.textColor = "textColor_0"
            }
        }
        
        Thread.sleep(forTimeInterval: 2)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

