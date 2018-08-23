//
//  GitHubRouter.swift
//  GithubTrendingProjects
//
//  Created by Dang Quoc Huy on 8/22/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Alamofire

public enum GitHubRouter: URLRequestConvertible {
  enum Constants {
    static let baseURLPath = "https://api.github.com"
    static let v3JSON = "application/vnd.github.v3+json"
    
    static let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"
      return formatter
    }()

  }
  
  case trendingRepos
  
  var method: HTTPMethod {
    switch self {
    case .trendingRepos:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .trendingRepos:
      return "/search/repositories"
    }
  }
  
  var parameters: [String: Any] {
    switch self {
    case .trendingRepos:
      // query list of repos created before last 30 days, sort by most stars
      let last30Days = Calendar.current.date(byAdding: .day, value: -30, to: Date())
      let q = "created:>\(Constants.dateFormatter.string(from: last30Days!))"
      return ["q" : q, "sort" : "stars", "order" : "desc"]
    }
  }
  
  public func asURLRequest() throws -> URLRequest {
    let url = try Constants.baseURLPath.asURL()
    
    var request = URLRequest(url: url.appendingPathComponent(path))
    request.httpMethod = method.rawValue
    request.setValue(Constants.v3JSON, forHTTPHeaderField: "Accept")
    request.timeoutInterval = TimeInterval(10 * 1000)
    
    return try URLEncoding.default.encode(request, with: parameters)
  }
}
