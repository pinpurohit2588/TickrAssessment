//
//  WebService.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import Foundation
import Combine

protocol WebServiceProtocol {
  func dataPublisher(for url: URL) -> AnyPublisher<Data, Error>
}

class WebService: WebServiceProtocol {
  func dataPublisher(for url: URL) -> AnyPublisher<Data, Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
      .tryMap { (data, response) -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
          throw ConnectionError.badServerResponse
        }
        
        return data
      }
      .eraseToAnyPublisher()
  }
}

