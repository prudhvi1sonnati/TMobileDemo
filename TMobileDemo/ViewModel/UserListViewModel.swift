//
//  UserListViewModel.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import Foundation
import KVNProgress

typealias loginCompletion = (Bool, String) -> Void
class UserListViewModel {
    
    var loginVC: GithubLoginHelper?
    
    var userList: Dynamic<[User]> = Dynamic([])
    var filtredList: Dynamic<[User]> = Dynamic([])
    var errorMsg: Dynamic<String> = Dynamic("")
    
    func login(_ completion: @escaping loginCompletion) {
        self.loginVC =  GithubLoginHelper(clientID: GitHubKeys.clientId, clientSecret: GitHubKeys.clientStatic, redirectURL: GitHubKeys.redirectURL)
        self.loginVC?.login(withScopes: [Scopes.user], allowSignup: true, completion: { token in
            accessToken = token
            print("Token----\(accessToken)\n")
            completion(true, "")
        }, error: { error in
            print(error.localizedDescription)
            completion(false, error.localizedDescription)
        })
    }
    
    func getUserList() {
        KVNProgress.show()
        self.loginVC = nil
        APIManager.shared.call(type: .users, params: nil) {[weak self] (result: Swift.Result<[User], CustomError>) in
            KVNProgress.dismiss(completion: {
                switch result {
                case .success(let data):
                    print("\(data)")
                    self?.userList.value = data
                    self?.filtredList.value = data
                case .failure(let error):
                    print(error.body)
                    self?.errorMsg.value = error.body
                }
            })
            
        }
    }
    
    func searchUser(_ text: String) {
        if text.isEmpty {
            self.filtredList.value = self.userList.value
        } else {
            self.filtredList.value = self.userList.value.filter({$0.login?.contains(text.lowercased()) ?? false})
        }
    }
    
}
