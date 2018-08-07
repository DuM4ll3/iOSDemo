//
//  AppDelegate.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 7/30/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: UINavigationController {
        return window!.rootViewController as! UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = makeCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // resource leak detection logic for RxSwift
//        debugMemoryLeaks()
        
        applicationCoordinator.start()
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        return ApplicationCoordinator(
            router: RouterImp(rootController: rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }
    
    private func debugMemoryLeaks() {
        _ = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                print("RxSwift[\(#function)]: \(RxSwift.Resources.total)")
            })
    }
}

