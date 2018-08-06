//
//  ItemsListView.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import RxSwift

protocol ItemsListView: BaseView {
    var onItemsDidLoad: (() -> Observable<[ItemList]>)? { get set }
    var onItemSelect: ((ItemList) -> Void)? { get set }
}
