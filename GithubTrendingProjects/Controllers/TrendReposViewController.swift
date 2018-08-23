//
//  ViewController.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit

class TrendReposViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  let searchController = UISearchController(searchResultsController: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Github Trends"
    
    // setup table view
    tableView.delegate = self
    tableView.dataSource = self
    tableView.estimatedRowHeight = 103
    tableView.rowHeight = UITableViewAutomaticDimension
    // register table cell
    tableView.register(UINib(nibName: String(describing: RepoViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RepoViewCell.self))
    
    // setup search controller
    searchController.searchResultsUpdater = self
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true
    tableView.tableHeaderView = searchController.searchBar
    
    GitHubAPI.getTrendingRepos { repos in
      guard let repos =  repos else { return }
    }
  }
  
  // MARK: - Private instance methods
  
  func filterContentForSearchText(_ searchText: String) {
    // TODO: implement search here
  }
  
}

// MARK: - UITableViewDataSource

extension TrendReposViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepoViewCell.self)) as! RepoViewCell
    
    // set dummy data
    cell.projectNameLabel.text = "Project \(indexPath.row)"
    cell.starCountLabel.text = "Star: \(indexPath.row)"
    cell.descriptionLabel.text = "This is a very long text.\nThis is a very long text.\nThis is a very long text.\nThis is a very long text.\nThis is a very long text.\n"

    return cell
  }
  
}

// MARK: - UITableViewDelegate

extension TrendReposViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    // TODO: show repo detail view
  }
}

// MARK: - UISearchResultsUpdating Delegate

extension TrendReposViewController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text!)
  }
  
}
