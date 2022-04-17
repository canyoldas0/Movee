//
//  NowPlayingMovieListProvider.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 17.04.2022.
//

import Foundation

class NowPlayingMovieListProvider: ApiServiceProvider<NowPlayingMovieListRequest> {
    
    init(request: NowPlayingMovieListRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.nowPlayingMovies.value,
                   data: request)
    }
}

class NowPlayingMovieListRequest: Codable {
    
    private(set) public var page: Int = 1
    private(set) public var api_key: String = "da341460ab89e31e92146f13adfbe54c"
    
    public init(page: Int = 1) {
            self.page = page
        }
    
}
