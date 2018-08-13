//
//  ItemsListView.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import RxCocoa

protocol ItemsListView: BaseView {
    var onItemsDidLoad: (() -> Driver<[ItemList]>)? { get set }
    var onItemSelect: ((ItemList) -> Void)? { get set }
}
