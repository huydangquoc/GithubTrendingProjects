//
//  ViewController.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit
import PKHUD

class TrendReposViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  let searchController = UISearchController(searchResultsController: nil)
  let viewModel = ViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Github Trends"
    
    HUD.dimsBackground = false
    HUD.allowsInteraction = false
    
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
    
    // load trending repos
    loadRepos()
  }
  
  // MARK: - Private instance methods
  
  private func loadRepos() {
    // show HUD
    HUD.show(.progress)
    
    GitHubAPI.getTrendingRepos { [weak self] repos in
      guard let repos =  repos else { return }
      
      // hide HUD
      HUD.hide()
      
      self?.viewModel.set(repos: repos)
      self?.tableView.reloadData()
    }
  }
  
  private func filterContentForSearchText(_ searchText: String) {
    // TODO: implement search here
  }
  
}

// MARK: - UITableViewDataSource

extension TrendReposViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRepos
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepoViewCell.self)) as! RepoViewCell
    
    viewModel.configCell(cell: cell, at: indexPath.row)

    return cell
  }
  
}

// MARK: - UITableViewDelegate

extension TrendReposViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    // show repo detail view
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    if let repoDetailVC = storyboard.instantiateViewController(withIdentifier: String(describing: RepoDetailViewController.self)) as? RepoDetailViewController {
      // set repo for view model
      repoDetailVC.viewModel.repo = viewModel.repo(at: indexPath.row)
      // set text back button
      let backItem = UIBarButtonItem()
      backItem.title = "Back"
      navigationItem.backBarButtonItem = backItem
      // push to detail repo view
      navigationController?.pushViewController(repoDetailVC, animated: true)
    }
  }
  
}

// MARK: - UISearchResultsUpdating Delegate

extension TrendReposViewController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text!)
  }
  
}
