//
//  ItemCoordinator.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class ItemCoordinator: BaseCoordinator {
    private let factory: ItemModuleFactory
    private let router: Router
    
    init(router: Router, factory: ItemModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() { showItemList() }
    
    //MARK: - Run current flow's controllers
    private func showItemList() {
        
        let itemsOutput = factory.makeItemsOutput()
        // FIXME: manager as DI
        var manager = BeerManager(with: itemsOutput.searchString.filterNil())

        itemsOutput.itemsList = manager.beers
        itemsOutput.onItemSelect = { [weak self] (item) in
            self?.showItemDetail(item)
        }
        
        router.setRootModule(itemsOutput)
    }
    
    private func showItemDetail(_ item: ItemList) {
        let itemDetailFlowOutput = factory.makeItemDetailOutput(item: item)
        router.push(itemDetailFlowOutput)
    }
}
