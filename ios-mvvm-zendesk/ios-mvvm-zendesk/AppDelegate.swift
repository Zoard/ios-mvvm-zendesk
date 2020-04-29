//
//  AppDelegate.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 28/04/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavigationBar()
        setupInitialScreen()
        return true
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupInitialScreen() {
        window!.rootViewController = ViewController()
        window!.makeKeyAndVisible()
    }
}

