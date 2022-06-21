//
//  MovieAPI.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 21.06.2022.
//

import Foundation
import Combine

protocol MoviesNetworkProtocol: AnyObject {
    
    func getPopularMovies() -> AnyPublisher<MovieListResponse,Error>
    func getTopRatedMovies() -> AnyPublisher<MovieListResponse,Error>
}

class MoviesAPI: MoviesNetworkProtocol {
    
    func getPopularMovies() -> AnyPublisher<MovieListResponse,Error> {
        return BaseAPI.shared.execute(EndpointHelper.popularMovies.getURL(),
                                  decodingType: MovieListResponse.self)
    }
    
    func getTopRatedMovies() -> AnyPublisher<MovieListResponse,Error> {
        return BaseAPI.shared.execute(EndpointHelper.topRatedMovies.getURL(),
                                  decodingType: MovieListResponse.self)
    }
}
