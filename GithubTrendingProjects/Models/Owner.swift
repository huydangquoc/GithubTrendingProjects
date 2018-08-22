//
//  Owner.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import ObjectMapper

struct Owner: Mappable {
  var name: String = ""
  var avatar: String = ""
  
  init?(map: Map) { }
  
  mutating func mapping(map: Map) {
    name    <- map["login"]
    avatar  <- map["avatar_url"]
  }
}
