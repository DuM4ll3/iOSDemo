//
//  ApplicationCoordinator.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        runMainFlow()
    }
    
    private func runMainFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
        addDependecy(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
}
