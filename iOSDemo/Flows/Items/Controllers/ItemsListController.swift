//
//  ItemsListController.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

final class ItemsListController: UIViewController, ItemsListView {
    var onItemSelect: ((ItemList) -> ())?
}
