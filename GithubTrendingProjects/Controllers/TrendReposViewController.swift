//
//  ViewController.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit

class TrendReposViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Github Trends"
    
    GitHubAPI.getTrendingRepos { repos in
      guard let repos =  repos else { return }
    }
  }
  
}
