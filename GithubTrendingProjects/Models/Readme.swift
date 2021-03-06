//
//  Readme.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Readme {
  let name: String
  let url: String
  
  init(json: JSON) {
    name = json["name"].stringValue
    url = json["download_url"].stringValue
  }
}
