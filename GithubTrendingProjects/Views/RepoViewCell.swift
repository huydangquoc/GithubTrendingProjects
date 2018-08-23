//
//  RepoViewCell.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit

class RepoViewCell: UITableViewCell {
  
  @IBOutlet weak var projectNameLabel: UILabel!
  @IBOutlet weak var starCountLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}
