//
//  BeerManager.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Moya
import Moya_ModelMapper
import RxOptional
import RxSwift

struct BeerManager: Networkable {
    
    func requestBeer() {
        // Make sure you retain the provider or the dependency chain that it holds somewhere, as they will get deallocated if you fail to do so.
        let beerProvider = provider
        beerProvider.rx
            .request(.beers)
            .debug()
            .mapOptional(to: [Beer].self)
            .subscribe({ (event) in
                switch event {
                case let .success(beers): print(beers?.first?.foodPairing.debugDescription)
                case let .error(error): print(error.localizedDescription)
                }
            })
    }
}
