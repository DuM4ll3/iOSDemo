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

struct BeerManager {
    let provider: MoyaProvider<BeerApi>
    
    func listBeers() -> Observable<[Beer]> {
        return provider.rx
            .request(.beers)
            .debug()
            .mapOptional(to: [Beer].self)
            .asObservable()
            .replaceNilWith([])
    }
}
