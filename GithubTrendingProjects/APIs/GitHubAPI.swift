//
//  GitHubAPI.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GitHubAPI {
  
  class func getTrendingRepos(completion: @escaping ([Repo]?) -> Void) {
    Alamofire.request(GitHubRouter.trendingRepos)
      .responseJSON {response in
        guard response.result.isSuccess,
          let value = response.result.value else {
            print("Error while fetching trending repos: \(String(describing: response.result.error))")
            completion(nil)
            return
        }
        
        let repos = JSON(value)["items"].array?.map { json in
          Repo(json: json)
        }
        
        completion(repos)
    }
  }
}
