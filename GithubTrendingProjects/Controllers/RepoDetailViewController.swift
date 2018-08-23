//
//  RepoDetailViewController.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var starButton: UIButton!
  @IBOutlet weak var forkButton: UIButton!
  @IBOutlet weak var readmeLabel: UILabel!
  @IBOutlet weak var readmeTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set dummy title
    title = "{Project name here}"
    
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
  }
}
