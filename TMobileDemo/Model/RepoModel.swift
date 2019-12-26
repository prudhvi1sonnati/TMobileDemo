//
//  RepoModel.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import Foundation

struct RepoModel: Codable {
    
    let archiveUrl : String?
    let archived : Bool?
    let assigneesUrl : String?
    let blobsUrl : String?
    let branchesUrl : String?
    let cloneUrl : String?
    let collaboratorsUrl : String?
    let commentsUrl : String?
    let commitsUrl : String?
    let compareUrl : String?
    let contentsUrl : String?
    let contributorsUrl : String?
    let createdAt : String?
    let defaultBranch : String?
    let deploymentsUrl : String?
    let descriptionField : String?
    let disabled : Bool?
    let downloadsUrl : String?
    let eventsUrl : String?
    let fork : Bool?
    let forks : Int?
    let forksCount : Int?
    let forksUrl : String?
    let fullName : String?
    let gitCommitsUrl : String?
    let gitRefsUrl : String?
    let gitTagsUrl : String?
    let gitUrl : String?
    let hasDownloads : Bool?
    let hasIssues : Bool?
    let hasPages : Bool?
    let hasProjects : Bool?
    let hasWiki : Bool?
    let homepage : String?
    let hooksUrl : String?
    let htmlUrl : String?
    let id : Int?
    let issueCommentUrl : String?
    let issueEventsUrl : String?
    let issuesUrl : String?
    let keysUrl : String?
    let labelsUrl : String?
    let language : String?
    let languagesUrl : String?
    let license : License?
    let mergesUrl : String?
    let milestonesUrl : String?
    let mirrorUrl : String?
    let name : String?
    let nodeId : String?
    let notificationsUrl : String?
    let openIssues : Int?
    let openIssuesCount : Int?
    let owner : User?
    let permissions : Permission?
    let privateField : Bool?
    let pullsUrl : String?
    let pushedAt : String?
    let releasesUrl : String?
    let size : Int?
    let sshUrl : String?
    let stargazersCount : Int?
    let stargazersUrl : String?
    let statusesUrl : String?
    let subscribersUrl : String?
    let subscriptionUrl : String?
    let svnUrl : String?
    let tagsUrl : String?
    let teamsUrl : String?
    let treesUrl : String?
    let updatedAt : String?
    let url : String?
    let watchers : Int?
    let watchersCount : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case archiveUrl = "archive_url"
        case archived = "archived"
        case assigneesUrl = "assignees_url"
        case blobsUrl = "blobs_url"
        case branchesUrl = "branches_url"
        case cloneUrl = "clone_url"
        case collaboratorsUrl = "collaborators_url"
        case commentsUrl = "comments_url"
        case commitsUrl = "commits_url"
        case compareUrl = "compare_url"
        case contentsUrl = "contents_url"
        case contributorsUrl = "contributors_url"
        case createdAt = "created_at"
        case defaultBranch = "default_branch"
        case deploymentsUrl = "deployments_url"
        case descriptionField = "description"
        case disabled = "disabled"
        case downloadsUrl = "downloads_url"
        case eventsUrl = "events_url"
        case fork = "fork"
        case forks = "forks"
        case forksCount = "forks_count"
        case forksUrl = "forks_url"
        case fullName = "full_name"
        case gitCommitsUrl = "git_commits_url"
        case gitRefsUrl = "git_refs_url"
        case gitTagsUrl = "git_tags_url"
        case gitUrl = "git_url"
        case hasDownloads = "has_downloads"
        case hasIssues = "has_issues"
        case hasPages = "has_pages"
        case hasProjects = "has_projects"
        case hasWiki = "has_wiki"
        case homepage = "homepage"
        case hooksUrl = "hooks_url"
        case htmlUrl = "html_url"
        case id = "id"
        case issueCommentUrl = "issue_comment_url"
        case issueEventsUrl = "issue_events_url"
        case issuesUrl = "issues_url"
        case keysUrl = "keys_url"
        case labelsUrl = "labels_url"
        case language = "language"
        case languagesUrl = "languages_url"
        case license = "license"
        case mergesUrl = "merges_url"
        case milestonesUrl = "milestones_url"
        case mirrorUrl = "mirror_url"
        case name = "name"
        case nodeId = "node_id"
        case notificationsUrl = "notifications_url"
        case openIssues = "open_issues"
        case openIssuesCount = "open_issues_count"
        case owner
        case permissions
        case privateField = "private"
        case pullsUrl = "pulls_url"
        case pushedAt = "pushed_at"
        case releasesUrl = "releases_url"
        case size = "size"
        case sshUrl = "ssh_url"
        case stargazersCount = "stargazers_count"
        case stargazersUrl = "stargazers_url"
        case statusesUrl = "statuses_url"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case svnUrl = "svn_url"
        case tagsUrl = "tags_url"
        case teamsUrl = "teams_url"
        case treesUrl = "trees_url"
        case updatedAt = "updated_at"
        case url = "url"
        case watchers = "watchers"
        case watchersCount = "watchers_count"
    }
}

struct Permission: Codable {
    
    let admin : Bool?
    let pull : Bool?
    let push : Bool?
    
    enum CodingKeys: String, CodingKey {
        case admin = "admin"
        case pull = "pull"
        case push = "push"
    }
}


struct License : Codable {
    
    let key : String?
    let name : String?
    let nodeId : String?
    let spdxId : String?
    let url : String?
    
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case nodeId = "node_id"
        case spdxId = "spdx_id"
        case url = "url"
    }
}
