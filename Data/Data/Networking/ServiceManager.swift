//
//  ServiceManager.swift
//  Data
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Combine

public enum ExchangeError: Error {
  case parsing(description: String)
  case network(description: String)
}

class ServiceManager {
    
    static let shared = ServiceManager()
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    struct ExchangeAPI {
      static let scheme = "https"
      static let host   = "run.mocky.io"
      static let path   = "/v3/b4ac4204-dfe5-48d1-8454-d5d56aa6c0d0"
    }
        
    private func makeEndPoint(_ path: String) -> URLComponents {
      var components = URLComponents()
      components.scheme = ExchangeAPI.scheme
      components.host   = ExchangeAPI.host
      components.path   = path
      return components
    }
    
    func load<T>(with url: String) -> AnyPublisher<T, ExchangeError> where T: Decodable {
        let components = makeEndPoint(url)
        guard let url = components.url else {
            let error = ExchangeError.network(description: "Error al clear la URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}
