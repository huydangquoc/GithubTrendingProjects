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
    
    var repos = [Repo]()
    private var filteredRepos = [Repo]()
    
    var numberOfRepos: Int {
      return filteredRepos.count
    }
    
    func repo(at index: Int) -> Repo {
      return filteredRepos[index]
    }
    
    func set(repos: [Repo]) {
      self.repos = repos
      applySearch(searchText: "")
    }
    
    func applySearch(searchText: String) {
      if searchText == "" {
        filteredRepos = repos
      } else {
        filteredRepos = repos.filter { $0.name.lowercased().contains(searchText.lowercased()) }
      }
    }
    
    func configCell(cell: RepoViewCell, at index: Int) {
      // TODO: guard out of index
      
      cell.projectNameLabel.text = filteredRepos[index].name
      cell.starCountLabel.text = "Star: \(filteredRepos[index].starCount)"
      cell.descriptionLabel.text = filteredRepos[index].description
    }

  }
}
