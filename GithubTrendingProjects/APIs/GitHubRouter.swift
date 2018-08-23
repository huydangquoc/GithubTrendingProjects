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
      // TODO: generate last 30 days by Date object
      return ["q" : "created:>2018-08-01", "sort" : "stars", "order" : "desc"]
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
