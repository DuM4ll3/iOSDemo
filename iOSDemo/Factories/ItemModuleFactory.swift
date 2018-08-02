//
//  ItemModuleFactory.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol ItemModuleFactory {
    func makeItemsOutput() -> ItemsListView
    func makeItemDetailOutput(item: ItemList) -> ItemDetailView
}
