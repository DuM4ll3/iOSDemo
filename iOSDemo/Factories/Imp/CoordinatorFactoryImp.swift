//
//  CoordinatorFactoryImp.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
    
    func makeItemCoordinator() -> Coordinator { return makeItemCoordinator(navController: nil) }
    
    func makeItemCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = ItemCoordinator(
            router: router(navController),
            factory: ModuleFactoryImp()
        )
        return coordinator
    }
    
    func makeSettingsCoordinator() -> Coordinator {
        return makeSettingsCoordinator(navController: nil)
    }
    
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = SettingsCoordinator(router: router(navController), factory: ModuleFactoryImp())
        return coordinator
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
