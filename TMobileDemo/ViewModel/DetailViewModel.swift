//
//  DetailViewModel.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 07/12/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import UIKit


class DetailViewModel {
    
    var userDetail: Dynamic<UserDetail> = Dynamic(UserDetail(avatarUrl: nil, bio: nil, blog: nil, company: nil, createdAt: nil, email: nil, eventsUrl: nil, followers: nil, followersUrl: nil, following: nil, followingUrl: nil, gistsUrl: nil, gravatarId: nil, hireable: nil, htmlUrl: nil, id: nil, location: nil, login: nil, name: nil, nodeId: nil, organizationsUrl: nil, publicGists: nil, publicRepos: nil, receivedEventsUrl: nil, reposUrl: nil, siteAdmin: nil, starredUrl: nil, subscriptionsUrl: nil, type: nil, updatedAt: nil, url: nil))

    var repoList: Dynamic<[RepoModel]> = Dynamic([])
    var filtredList: Dynamic<[RepoModel]> = Dynamic([])
    var errorMsg: Dynamic<String> = Dynamic("")
    
    func getRepoList(_ userName: String) {
        APIManager.shared.call(type: .userRepo(userName), params: nil) {[weak self] (result: Swift.Result<[RepoModel], CustomError>) in
            switch result {
            case .success(let data):
                print("\(data)")
                self?.repoList.value = data
                self?.filtredList.value = data
            case .failure(let error):
                print(error.body)
                self?.errorMsg.value = error.body
            }
        }
    }
    
    func getUserDetail(_ userName: String) {
        APIManager.shared.call(type: .userDetail(   userName), params: nil) {[weak self] (result: Swift.Result<UserDetail, CustomError>) in
            switch result {
            case .success(let data):
                print("\(data)")
                self?.userDetail.value = data
            case .failure(let error):
                print(error.body)
                self?.errorMsg.value = error.body
            }
        }
    }
    
    func searchUser(_ text: String) {
        if text.isEmpty {
            self.filtredList.value = self.repoList.value
        } else {
            self.filtredList.value = self.repoList.value.filter({$0.name?.contains(text.lowercased()) ?? false})
        }
    }
    
}
