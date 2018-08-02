//
//  SettingsCoordinator.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class SettingsCoordinator: BaseCoordinator {
    
    private let router: Router
    private let factory: SettingsModuleFactory
    
    init(router: Router, factory: SettingsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    private func showSettings() {
        let settingsFlowOutput = factory.makeSettingsOutput()
        router.setRootModule(settingsFlowOutput)
    }
}
