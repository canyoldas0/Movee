//
//  AppDelegate.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 14.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        let splashVC = SplashViewController(nibName: SplashViewController.identifier, bundle: nil)
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
        return true
    }
}

