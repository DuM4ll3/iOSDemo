//
//  TabbarCoordinator.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

final class TabbarCoordinator: BaseCoordinator {
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = runItemFlow()
        tabbarView.onItemFlowSelect = runItemFlow()
        tabbarView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func runItemFlow() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let itemCoordinator = self.coordinatorFactory.makeItemCoordinator(navController: navController)
                itemCoordinator.start()
                self.addDependecy(itemCoordinator)
            }
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
                settingsCoordinator.start()
                self.addDependecy(settingsCoordinator)
            }
        }
    }
}
