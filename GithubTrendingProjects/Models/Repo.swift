//
//  Repo.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import ObjectMapper

struct Repo: Mappable {
  var name: String = ""
  var starCount: Int = 0
  var description: String = ""
  var owner: Owner!
  
  init?(map: Map) { }
  
  mutating func mapping(map: Map) {
    name        <- map["name"]
    starCount   <- map["stargazers_count"]
    description <- map["description"]
    owner       <- map["owner"]
  }
}
