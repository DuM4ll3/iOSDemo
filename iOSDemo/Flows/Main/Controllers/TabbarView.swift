//
//  TabbarView.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

protocol TabbarView: BaseView {
    var onItemFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onViewDidLoad: ((UINavigationController) -> Void)? { get set }
}
