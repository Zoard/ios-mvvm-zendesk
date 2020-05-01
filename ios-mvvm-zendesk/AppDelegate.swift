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
//        UINavigationBar.appearance().barTintColor = UIColor.white
//        UINavigationBar.appearance().tintColor = UIColor(named: "#657986")
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(named: "#657986")]
    }
    
    private func setupInitialScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = TicketsListViewModel()
        let ticketsListViewController = TicketsListViewController(viewModel: viewModel)
        window!.rootViewController = ticketsListViewController
        window!.makeKeyAndVisible()
    }
}

