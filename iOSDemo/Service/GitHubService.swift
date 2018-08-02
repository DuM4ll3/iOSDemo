//
//  GitHubService.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 7/31/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Moya

enum GitHubApi {
    case UserProfile(username: String)
    case Repos(username: String)
    case Repo(fullName: String)
    case Issues(repositoryFullName: String)
}

extension GitHubApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .Repos(let name): return "/users/\(name.URLEscapedString)/repos"
        case .UserProfile(let name): return "/users/\(name.URLEscapedString)"
        case .Repo(let name): return "/repos/\(name)"
        case .Issues(let repositoryName): return "/repos/\(repositoryName)/issues"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .Repos(_): return "{{\"id\": \"1\", \"language\": \"Swift\", \"url\": \"https://api.github.com/repos/mjacko/Router\", \"name\": \"Router\"}}}".data(using: String.Encoding.utf8)!
            
        case .UserProfile(let name): return "{\"login\": \"\(name)\", \"id\": 100}".data(using: String.Encoding.utf8)!
            
        case .Repo(_): return "{\"id\": \"1\", \"language\": \"Swift\", \"url\": \"https://api.github.com/repos/mjacko/Router\", \"name\": \"Router\"}".data(using: String.Encoding.utf8)!
            
        case .Issues(_): return "{\"id\": 132942471, \"number\": 405, \"title\": \"Updates example with fix to String extension by changing to Optional\", \"body\": \"Fix it pls.\"}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

private extension String {
    var URLEscapedString: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
