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
    
    func requestBeer() -> Observable<Beer?> {
//        provider.request(.beers) { (result) in
//            switch result {
//            case let .success(moyaResponse): print(moyaResponse.data)
//            case let .failure(error): print(error.errorDescription)
//            }
//        }
        
        return provider.rx
            .request(.beers)
            .debug()
            .mapOptional(to: Beer.self)
            .asObservable()
    }
}
