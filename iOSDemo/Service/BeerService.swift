//
//  BeerService.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Moya

enum BeerApi {
    case beers
}

extension BeerApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2")!
    }
    
    var path: String {
        switch self {
        case .beers: return "/beers/1"
        }
    }
    
    var method: Method {
        switch self {
        case .beers: return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .beers: return mockedResponse("MockedBeer")
        }
    }
    
    var task: Task {
        switch self {
        case .beers: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    private func mockedResponse(_ fileName: String) -> Data {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url) else { return Data() }
        return data
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
