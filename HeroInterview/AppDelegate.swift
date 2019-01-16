//
//  AppDelegate.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAPIClient()
        return true
    }
}

private extension AppDelegate {
    func setupAPIClient() {
        APIClient.shared.setup(withURL: "https://www.datakick.org/api/")
    }
}

