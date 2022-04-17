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
    case failure(ErrorResponse)
    
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
        guard let urlRequest = try? PopularMovieListProvider(request: PopularMovieListDataRequest()).returnUrlRequest() else { return }
        networkManager?.getPopularMovies(with: urlRequest) { [weak self] response in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let response):
                strongSelf.handlePopularMoviesResponse(response: response)
            case .failure(let errorModel):
                strongSelf.popularMoviesState?(.failure(errorModel))
            }
        }
    }
    
    func getNowPlayingMoviesData() {
        guard let urlRequest = try? NowPlayingMovieListProvider(request: NowPlayingMovieListRequest()).returnUrlRequest() else { return }
        networkManager?.getPopularMovies(with: urlRequest) { [weak self] response in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let response):
                return
//                strongSelf.handlePopularMoviesResponse(response: response)
            case .failure(let errorModel):
                strongSelf.popularMoviesState?(.failure(errorModel))
            }
        }
    }
    
    
    private func handlePopularMoviesResponse(response: MovieListDataResponse) {
        dataFormatter?.setData(with: response)
        popularMoviesState?(.done)
    }
    
    
    
    // MARK: -- Vertical TableView Methods
    func getNumberOfRows() -> Int {
        return 0
    }
}
