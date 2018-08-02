//
//  Networkable.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<BeerApi> { get }
}

extension Networkable {
    var provider: MoyaProvider<BeerApi> {
        return MoyaProvider<BeerApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
}
