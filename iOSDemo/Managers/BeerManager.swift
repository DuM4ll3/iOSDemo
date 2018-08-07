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
        // TODO: move the 'do' to the coordinator
        return provider.rx
            .request(.beers(page: 1, perPage: 5))
            .debug(#function)
            .asObservable()
            .single()
            .mapOptional(to: [Beer].self)
            .replaceNilWith([])
            .do(onNext: { (beers) in
                print("onNext")
            },
                onError: { (error) in
                    print(error.localizedDescription)
            },
                onCompleted: {
                    print("onCompleted")
            },
                onSubscribe: {
                    print("onSub")
            },
                onSubscribed: {
                    print("onSubed")
            },
                onDispose: {
                    print("onDispose")
            })
    }
}
