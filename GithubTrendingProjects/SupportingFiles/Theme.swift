//
//  Theme.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/23/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit

struct Theme {
  static let mainColor = UIColor.darkGray
  
  static func apply() {
    UIApplication.shared.delegate?.window??.tintColor = mainColor
    UINavigationBar.appearance().tintColor = mainColor
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : mainColor]
  }
}
