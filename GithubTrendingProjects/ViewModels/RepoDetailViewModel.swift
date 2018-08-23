//
//  RepoDetailViewModel.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import Alamofire

extension RepoDetailViewController {
  
  class ViewModel {
    
    var repo: Repo!
    
    func configView(view: RepoDetailViewController) {
      // populate repo and owner info to view
      view.navigationItem.title = repo.name
      view.nameLabel.text = repo.owner.name
      view.descriptionLabel.text = repo.description
      view.starButton.setTitle("\(repo.starCount) Stars", for: .normal)
      view.forkButton.setTitle("\(repo.forkCount) Forks", for: .normal)
      
      // load avatar
      if let url = URL(string: repo.owner.avatar) {
        Alamofire.request(url).responseData { response in
          if let data = response.data {
            view.avatarImageView.image = UIImage(data: data)
          }
        }
      }
    }
    
  }
  
}
