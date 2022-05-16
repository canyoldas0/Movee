//
//  MoviesViewModel.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import Foundation

enum MovieListViewState {
    
    case loading
    case done
    case failure
    
}

class MoviesViewModel {
 
    let networkManager: MoviesNetworkManagerProtocol?
    private var popularMoviesState: MovieListViewStateBlock?
    weak var dataFormatter: MoviesDataFormatterProtocol?
    
    init(networkManager: MoviesNetworkManagerProtocol?, dataFormatter: MoviesDataFormatterProtocol) {
        self.networkManager = networkManager
        self.dataFormatter = dataFormatter
    }
    
    // MARK: --  MovieList Methods
    func subscribePopularList(completion: @escaping MovieListViewStateBlock) {
        popularMoviesState = completion
    }
    
    func getPopularMoviesData() {
       
    }
    
    func getNowPlayingMoviesData() {
      
    }
    
    
    private func handlePopularMoviesResponse(response: MovieListDataResponse) {
//        dataFormatter?.setData(with: response)
        popularMoviesState?(.done)
        print("RESULT: \(response.results.count)")
        print("RESULT: \(response.results[0].title ?? "")")
    }
    
    
    
    // MARK: -- Vertical TableView Methods
    func getNumberOfRows() -> Int {
        return 0
    }
}
