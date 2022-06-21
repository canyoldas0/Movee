//
//  BaseAPI.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 21.06.2022.
//

import Foundation
import Combine


class BaseAPI {
    
    static let shared = BaseAPI()
    private let session = URLSession(configuration: .default)
    
    func execute<T>(_ url: URL,
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}

