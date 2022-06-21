//
//  MoviesViewModel.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import Foundation
import Combine

enum MovieListViewState {
    
    case loading
    case done
    case failure
    
}

final class MoviesViewModel {
    
    private let moviesAPI: MoviesNetworkProtocol
    private var moviesState: MovieListViewStateBlock?
    private var cancellables =  Set<AnyCancellable>()
    
    var popularMovies = [Movie]()
    var topRatedMovies = [Movie]()
    
    init(moviesAPI: MoviesNetworkProtocol = MoviesAPI()) {
        self.moviesAPI = moviesAPI
    }
    
    // MARK: --  MovieList Methods
    func subscribePopularList(completion: @escaping MovieListViewStateBlock) {
        moviesState = completion
    }
    
    func fetchData() {
        let popularMoviesPublisher = moviesAPI.getPopularMovies()
        let topRatedMoviesPublisher = moviesAPI.getTopRatedMovies()
        
        popularMoviesPublisher
            .zip(topRatedMoviesPublisher)
            .handleEvents( receiveOutput: { (topRatedResponse, popularResponse) in
                self.popularMovies = popularResponse.results
                self.topRatedMovies = topRatedResponse.results
                self.moviesState?(.done)
            }, receiveCompletion: { _ in })
            .sink(receiveCompletion: { _ in },
                  receiveValue: { _ in })
            .store(in: &cancellables)
    }
    
    
    
    // MARK: -- Vertical TableView Methods
    func getNumberOfRows() -> Int {
        return popularMovies.count
    }
    
    func getItem(at index: Int) -> Movie {
        return popularMovies[index]
    }
}
