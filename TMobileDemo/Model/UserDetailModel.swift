//
//  UserModel.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import Foundation

struct UserDetail : Codable {
    
    let avatarUrl : String?
    let bio : String?
    let blog : String?
    let company : String?
    let createdAt : String?
    let email : String?
    let eventsUrl : String?
    let followers : Int?
    let followersUrl : String?
    let following : Int?
    let followingUrl : String?
    let gistsUrl : String?
    let gravatarId : String?
    let hireable : String?
    let htmlUrl : String?
    let id : Int?
    let location : String?
    let login : String?
    let name : String?
    let nodeId : String?
    let organizationsUrl : String?
    let publicGists : Int?
    let publicRepos : Int?
    let receivedEventsUrl : String?
    let reposUrl : String?
    let siteAdmin : Bool?
    let starredUrl : String?
    let subscriptionsUrl : String?
    let type : String?
    let updatedAt : String?
    let url : String?
    
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case bio = "bio"
        case blog = "blog"
        case company = "company"
        case createdAt = "created_at"
        case email = "email"
        case eventsUrl = "events_url"
        case followers = "followers"
        case followersUrl = "followers_url"
        case following = "following"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case gravatarId = "gravatar_id"
        case hireable = "hireable"
        case htmlUrl = "html_url"
        case id = "id"
        case location = "location"
        case login = "login"
        case name = "name"
        case nodeId = "node_id"
        case organizationsUrl = "organizations_url"
        case publicGists = "public_gists"
        case publicRepos = "public_repos"
        case receivedEventsUrl = "received_events_url"
        case reposUrl = "repos_url"
        case siteAdmin = "site_admin"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case type = "type"
        case updatedAt = "updated_at"
        case url = "url"
    }
    
}
