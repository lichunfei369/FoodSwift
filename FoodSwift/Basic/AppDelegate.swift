//
//  AppDelegate.swift
//  FoodSwift
//
//  Created by Apple on 2021/7/12.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }

  


}

