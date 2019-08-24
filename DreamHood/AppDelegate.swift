//
//  AppDelegate.swift
//  DreamHood
//
//  Created by joyce wang on 8/13/19.
//  Copyright © 2019 joyce wang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public var context: AppContext!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateInitialViewController()
//        application.keyWindow?.rootViewController = vc
        
        context = AppContext()
        
        return true
    }
}

