//
//  CoordinatorFactory.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
    
    func makeItemCoordinator() -> Coordinator
    func makeItemCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeSettingsCoordinator() -> Coordinator
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator
}
