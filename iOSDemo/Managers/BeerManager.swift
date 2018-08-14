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
    private var query: Observable<String>
    
    lazy var beers: Driver<[Beer]> = listBeers()
    
    init(with query: Observable<String>,
         provider: MoyaProvider<BeerApi> = MoyaProvider<BeerApi>(plugins: [NetworkLoggerPlugin(verbose: true)]))
    {
        self.query = query
        self.provider = provider
    }
    
    private func listBeers() -> Driver<[Beer]> {
        return query
            .debug(#function)
            .flatMapLatest { return self.fetchBeers(for: $0) }
            .asDriver(onErrorJustReturn: [])
    }
    
    private func fetchBeers(for food: String) -> Observable<[Beer]> {
        return provider.rx
            .request(.beers(page: 1, perPage: 5, food: food))
            .debug(#function)
            .asObservable()
            .single()
            .filterSuccessfulStatusAndRedirectCodes()
            .mapOptional(to: [Beer].self)
            .replaceNilWith([])
    }
    
}
