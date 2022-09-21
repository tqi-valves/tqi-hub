//
//  AppDelegate.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 18/09/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: LoginController())
        window?.makeKeyAndVisible()
        
        return true
    }
}
