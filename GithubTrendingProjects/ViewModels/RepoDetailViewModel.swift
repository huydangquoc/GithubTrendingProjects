//
//  RepoDetailViewModel.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation

extension RepoDetailViewController {
  
  class ViewModel {
    
    var repo: Repo!
    var readme: Readme?
    
    var projectName: String {
      return repo.name
    }
    
    var ownerName: String {
      return repo.owner.name
    }
    
    var description: String {
      return repo.description
    }
    
    var starCount: String {
      return "\(repo.starCount) Stars"
    }
    
    var forkCount: String {
      return "\(repo.forkCount) Forks"
    }
    
    var avatarURL: String {
      return repo.owner.avatar
    }
    
    var readmeURL: String {
      return readme?.url ?? ""
    }
    
    var readmeFileName: String {
      return readme?.name ?? ""
    }
  }
  
}
