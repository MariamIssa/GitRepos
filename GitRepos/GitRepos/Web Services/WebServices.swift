//
//  WebServices.swift
//  GitRepos
//
//  Created by Mariam Issa on 4/16/18.
//  Copyright © 2018 Mariam Al Ethawy. All rights reserved.
//

import UIKit

//struct Root : Decodable {
//    let gitHubs : [GitHub]
//}
//
//struct GitHub: Codable {
//
//    var name: String?
//    var description: String?
//    var created_at: String?
//    var owner: Owner?
//    var license: License?
//
//    var id: String?
//    var full_name: String?
//    var private1: Bool?
//    var html_url: String?
//    var fork: String?
//    var url: String?
//    var forks_url: String?
//    var keys_url: String?
//    var collaborators_url: String?
//    var teams_url: String?
//    var hooks_url: String?
//    var issue_events_url: String?
//    var events_url: String?
//    var assignees_url: String?
//    var branches_url: String?
//    var tags_url: String?
//    var blobs_url: String?
//    var git_tags_url: String?
//    var git_refs_url: String?
//    var trees_url: String?
//    var statuses_url: String?
//    var languages_url: String?
//    var stargazers_url: String?
//    var contributors_url: String?
//    var subscribers_url: String?
//    var subscription_url: String?
//    var commits_url: String?
//    var git_commits_url: String?
//    var comments_url: String?
//    var issue_comment_url: String?
//    var contents_url: String?
//    var compare_url: String?
//    var merges_url: String?
//    var archive_url: String?
//    var downloads_url: String?
//    var issues_url: String?
//    var pulls_url: String?
//    var milestones_url: String?
//    var notifications_url: String?
//    var labels_url: String?
//    var releases_url: String?
//    var deployments_url: String?
//    var updated_at: String?
//    var pushed_at: String?
//    var git_url: String?
//    var ssh_url: String?
//    var clone_url: String?
//    var svn_url: String?
//    var homepage: String?
//    var size: String?
//    var stargazers_count: String?
//    var watchers_count: String?
//    var language: String?
//    var has_issues: String?
//    var has_projects: String?
//    var has_downloads: String?
//    var has_wiki: String?
//    var has_pages: String?
//    var forks_count: String?
//    var mirror_url: String?
//    var archived: String?
//    var open_issues_count: String?
//    var forks: Int?
//    var open_issues: Int?
//    var watchers: Int?
//    var default_branch: String?
//
//    private enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case description = "description"
//        case created_at = "created_at"
//        case owner = "owner"
//        case license = "license"
//    }
//}
//
//struct Owner: Codable {
//    var login: String?
//    var id: String
//    var avatar_url: String?
//    var gravatar_id: String?
//    var url: String?
//    var html_url: String?
//    var followers_url: String?
//    var following_url: String?
//    var gists_url: String?
//    var starred_url:  String?
//    var subscriptions_url: String?
//    var organizations_url:  String?
//    var repos_url:  String?
//    var events_url:  String?
//    var received_events_url:  String?
//    var type:  String?
//    var site_admin:  String?
//}
//
//struct License: Codable {
//    var license: String?
//    var key: String?
//    var name: String?
//    var spdx_id: String?
//    var url: String?
//
//    private enum CodingKeys: String, CodingKey {
//        case license = "license"
//    }
//}

class WebServices: NSObject {
    var session: URLSession
    
    
    override init() {
        let sessionConfig = URLSessionConfiguration.default
        
        self.session = URLSession(configuration: sessionConfig)
    }
    
    func getContents(fromUrl: String, completion: @escaping (Data)->Void, errorCompletion:@escaping (Error)->Void) ->Void {
        
        guard let gitUrl = URL(string: fromUrl) else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            if error != nil {
                errorCompletion(error!)
            } else {
                completion(data!)
            }
           
            }.resume()
    }
}
