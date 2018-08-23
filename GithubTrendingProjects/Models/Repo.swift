//
//  Repo.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Repo {
  let name: String
  let starCount: Int
  let description: String
  let owner: Owner
  
  init(json: JSON) {
    name = json["name"].stringValue
    starCount = json["stargazers_count"].intValue
    description = json["description"].stringValue
    owner = Owner(json: json["owner"])
  }
}
