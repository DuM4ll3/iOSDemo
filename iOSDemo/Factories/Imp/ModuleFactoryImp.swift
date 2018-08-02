//
//  ModuleFactoryImp.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class ModuleFactoryImp:
    ItemModuleFactory,
    SettingsModuleFactory {
    
    func makeItemsOutput() -> ItemsListView { return ItemsListController.controllerFromStoryboard(.items) }
    
    func makeItemDetailOutput(item: ItemList) -> ItemDetailView {
        let controller = ItemDetailController.controllerFromStoryboard(.items)
        controller.itemList = item
        return controller
    }
    
    func makeSettingsOutput() -> SettingsView { return SettingsController.controllerFromStoryboard(.settings) }
}
