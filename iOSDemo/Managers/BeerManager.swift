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
import RxCocoa

// TODO: run tests to check the filterSuccess & catchError methods
struct BeerManager {
    private var provider: MoyaProvider<BeerApi>
    lazy var beers: Driver<[Beer]> = listBeers()
    
    init(provider: MoyaProvider<BeerApi> = MoyaProvider<BeerApi>(plugins: [NetworkLoggerPlugin(verbose: true)])) {
        self.provider = provider
    }
    
    private func listBeers() -> Driver<[Beer]> {
        
        return provider.rx
            .request(.beers(page: 1, perPage: 5))
            .debug(#function)
            .asObservable()
            .single()
//            .filterSuccessfulStatusAndRedirectCodes()
//            .catchErrorJustReturn(<#T##element: Response##Response#>)
            .mapOptional(to: [Beer].self)
            .replaceNilWith([])
            .asDriver(onErrorJustReturn: [])
    }
}
