//
//  AppDelegate.swift
//  TestShopApp
//
//  Created by Артем Манасян on 11.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let signIn = SignInViewController()
//        let page1 = Page1ViewController()
//        let logIn = LogInViewController()
//        let mainTabBar = MainTabBarViewController()
//        let profile = ProfileViewController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = signIn
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }



}

