//
//  PopularMovieListProvider.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

class PopularMovieListProvider: ApiServiceProvider<PopularMovieListDataRequest> {
    
    init(request: PopularMovieListDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.popularMovies.value,
                   data: request)
    }
}

class PopularMovieListDataRequest: Codable {
    
    private(set) public var page: Int = 1
    private(set) public var api_key: String = "da341460ab89e31e92146f13adfbe54c"
    
    public init(page: Int = 1) {
            self.page = page
        }
    
}
