//
//  RepoDetailViewController.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit
import Alamofire

class RepoDetailViewController: UIViewController {
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var starButton: UIButton!
  @IBOutlet weak var forkButton: UIButton!
  @IBOutlet weak var readmeLabel: UILabel!
  @IBOutlet weak var readmeTextView: UITextView!
  
  let viewModel = ViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set dummy title
    title = "{Project name here}"
    
    // set style avatar
    avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    avatarImageView.clipsToBounds = true
    
    // set style star and fork buttons
    starButton.backgroundColor = .white
    starButton.layer.cornerRadius = 5
    starButton.layer.borderWidth = 1
    starButton.layer.borderColor = UIColor.gray.cgColor
    let starImage = UIImage(named: "star")
    let tintedStarImage = starImage?.withRenderingMode(.alwaysTemplate)
    starButton.setImage(tintedStarImage, for: .normal)
    starButton.tintColor = .gray
    
    forkButton.backgroundColor = .white
    forkButton.layer.cornerRadius = 5
    forkButton.layer.borderWidth = 1
    forkButton.layer.borderColor = UIColor.gray.cgColor
    let forkImage = UIImage(named: "fork")
    let tintedForkImage = forkImage?.withRenderingMode(.alwaysTemplate)
    forkButton.setImage(tintedForkImage, for: .normal)
    forkButton.tintColor = .gray
    
    // populate repo info to view
    populate()
  }
  
  // MARK: - Private instance methods
  
  private func populate() {
    // populate repo and owner info to view
    navigationItem.title = viewModel.projectName
    nameLabel.text = viewModel.ownerName
    descriptionLabel.text = viewModel.description
    starButton.setTitle(viewModel.starCount, for: .normal)
    forkButton.setTitle(viewModel.forkCount, for: .normal)
    
    // load avatar
    if let url = URL(string: viewModel.avatarURL) {
      Alamofire.request(url).responseData { [weak self] response in
        if let data = response.data {
          // set avatar image
          self?.avatarImageView.image = UIImage(data: data)
        }
      }
    }
    
    // load readme
    GitHubAPI.getReadme(owner: viewModel.ownerName, repo: viewModel.projectName) { [weak self] readme in
      if let readme = readme {
        // keep reademe
        self?.viewModel.readme = readme
        // set reademe file name
        self?.readmeLabel.text = self?.viewModel.readmeFileName
        
        // populate readme content to view
        if let url = self?.viewModel.readmeURL {
          Alamofire.request(url).responseString { response in
            let htmlSource = String(describing: response.result.value)
            // set readme content
            self?.readmeTextView.text = htmlSource
          }
        }
      }
    }
    
  }
}
