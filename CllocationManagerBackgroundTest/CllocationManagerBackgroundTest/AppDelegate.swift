//
//  AppDelegate.swift
//  CllocationManagerBackgroundTest
//
//  Created by Sjoerd Perfors on 12/10/2018.
//  Copyright © 2018 Flitsmeister. All rights reserved.
//

import UIKit
import CocoaLumberjackSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var logger: DDFileLogger?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if logger == nil,
            let fileLogger = DDFileLogger.init() {
            
            fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hour rolling, new file every day
            fileLogger.logFileManager.maximumNumberOfLogFiles = 10; // between 1 and 10 days of logs.
            fileLogger.maximumFileSize = 1024 * 4096; // 4MB so, max 40MB log file
            
            DDLog.add(fileLogger, with: .info)
        
            logger = fileLogger
        }
        
        LocationController.sharedInstance.start()
        
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

    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        DDLogInfo("[APPDELEGATE] [MEMORY-WARNING]")
    }
}

