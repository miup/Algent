//
//  AppDelegate.swift
//  Algent
//
//  Created by miup on 10/12/2017.
//  Copyright (c) 2017 miup. All rights reserved.
//

import UIKit
import Algent

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Algent.initialize(appID: "YOUR_APP_ID", apiKey: "YOUR_API_KEY")
        return true
    }

}
