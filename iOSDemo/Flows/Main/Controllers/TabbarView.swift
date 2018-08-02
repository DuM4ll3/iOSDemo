//
//  TabbarView.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

protocol TabbarView: BaseView {
    var onItemFlowSelect: ((UINavigationController) -> ())? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
}
