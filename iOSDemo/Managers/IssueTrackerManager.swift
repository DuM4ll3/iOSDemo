//
//  IssueTrackerManager.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 7/31/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Moya
import Moya_ModelMapper
import RxOptional
import RxSwift

protocol Networkable {
    var provider: MoyaProvider<GitHubApi> { get }
}

extension Networkable {
    internal var provider: MoyaProvider<GitHubApi> {
        return MoyaProvider<GitHubApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
}

struct IssueTrackerManager: Networkable {
    let repoName: Observable<String>
    
    func trackIssues() -> Observable<[Issue]> {
        return repoName
            .observeOn(MainScheduler.instance)
            .flatMapLatest { name -> Observable<Repository?> in
                return self.findRepository(name: name)
            }
            .flatMapLatest { repository -> Observable<[Issue]?> in
                guard let repository = repository else { return Observable.just(nil) }
                return self.findIssues(repository: repository)
            }
            .replaceNilWith([])
    }
    
    private func findIssues(repository: Repository) -> Observable<[Issue]?> {
        return provider.rx
            .request(.Issues(repositoryFullName: repository.fullName))
            .debug()
            .mapOptional(to: [Issue].self)
            .asObservable()
    }
    
    private func findRepository(name: String) -> Observable<Repository?> {
        return provider.rx
            .request(.Repo(fullName: name))
            .debug()
            .mapOptional(to: Repository.self)
            .asObservable()
    }
}
