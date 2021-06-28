//
//  ModelManager.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import Foundation
import Combine

typealias ModelPublisher = AnyPublisher<SearchResult?, Error>

protocol ModelManagerProtocol {
  func modelPublisher() -> ModelPublisher
}

class ModelManager: ModelManagerProtocol {
  private let webService: WebServiceProtocol
  
  init(webService: WebServiceProtocol) {
    self.webService = webService
  }
  
  func modelPublisher() -> ModelPublisher {
    guard let requestURL = createSearchURL() else {
      return Fail(error: ConnectionError.invalidSearchItem)
        .eraseToAnyPublisher()
    }
    return webService.dataPublisher(for: requestURL)
      .decode(type: SearchResult.self, decoder: JSONDecoder())
      .map { model in
          return model
      }
      .tryCatch { error in
        Fail(error: error)
          .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()
  }
    
  private func createSearchURL() -> URL? {
    let baseURL = Environment.baseUrl
    let searchURL = baseURL.appendingPathComponent(Path.search)
    var urlComponents = URLComponents(url: searchURL,
                                      resolvingAgainstBaseURL: false)
   urlComponents?.queryItems = [URLQueryItem(name: "api-key", value:"5cc8f07b-558a-4bc4-939e-acb0e838d274"),
                                URLQueryItem(name: "show-fields", value:"starRating,headline,thumbnail,short-url,trailText,body")]
    
    //page=2
    return urlComponents?.url
  }
}


