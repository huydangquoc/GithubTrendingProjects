//
//  Owner.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Owner {
  let name: String
  let avatar: String
  
  init(json: JSON) {
    name = json["login"].stringValue
    avatar = json["avatar_url"].stringValue
  }
}
