//
//  TrendReposViewModel.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation

extension TrendReposViewController {
  
  class ViewModel {
    
    var repos: [Repo]
    
    var numberOfRepos: Int {
      return repos.count
    }
    
    func repo(at index: Int) -> Repo {
      return repos[index]
    }
    
    func set(repos: [Repo]) {
      self.repos = repos
    }
    
    // MARK: Life Cycle
    init(repos: [Repo] = []) {
      self.repos = repos
    }
    
    func configCell(cell: RepoViewCell, at index: Int) {
      // TODO: guard out of index
      
      cell.projectNameLabel.text = repos[index].name
      cell.starCountLabel.text = "Star: \(repos[index].starCount)"
      cell.descriptionLabel.text = repos[index].description
    }

  }
}
