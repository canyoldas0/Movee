//
//  NetworkManager.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 17.04.2022.
//

import Foundation

protocol MoviesNetworkManagerProtocol: AnyObject {
    
//    func getPopularMovies(with request: URLRequest, with completion: @escaping MovieListResponseBlock)
}

class MoviesNetworkManager: MoviesNetworkManagerProtocol {
    
//    let networkService = NetworkManager.shared
    
//    func getPopularMovies(with request: URLRequest, with completion: @escaping MovieListResponseBlock) {
//        networkService.sendRequest(urlRequest: request, completion: completion)
//    }
}


// TODO: MockService for unit tests
//class MockService: MoviesNetworkManagerProtocol {
//
//
//    func getPopularMovies(with request: URLRequest, with completion: @escaping MovieListResponseBlock) {
//        completion(.success(MovieListDataResponse(page: 1, results: [MovieResult()], totalPages: 1, totalResults: 1)))
//    }
//}
