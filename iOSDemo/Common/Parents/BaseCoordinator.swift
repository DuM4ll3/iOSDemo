//
//  BaseCoordinator.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {}
    
    // add only unique object
    func addDependecy(_ coordinator: Coordinator) {
        if childCoordinators.index(where: { $0 === coordinator }) == nil {
            childCoordinators.append(coordinator)
        }
    }
    
    func removeDependency(_ coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false else { return }
        
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
