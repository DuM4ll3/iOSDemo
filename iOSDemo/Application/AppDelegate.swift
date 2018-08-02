//
//  AppDelegate.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 7/30/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: UINavigationController {
        return window!.rootViewController as! UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = makeCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        applicationCoordinator.start()
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        return ApplicationCoordinator(
            router: RouterImp(rootController: rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }
}

