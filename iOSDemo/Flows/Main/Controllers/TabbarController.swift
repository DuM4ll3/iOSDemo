//
//  TabbarController.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController, TabbarView {
    
    var onItemFlowSelect: ((UINavigationController) -> Void)?
    var onSettingsFlowSelect: ((UINavigationController) -> Void)?
    var onViewDidLoad: ((UINavigationController) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidLoad?(controller)
        }
    }
}

extension TabbarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        if selectedIndex == 0 {
            onItemFlowSelect?(controller)
        } else if selectedIndex == 1 {
            onSettingsFlowSelect?(controller)
        }
    }
}
