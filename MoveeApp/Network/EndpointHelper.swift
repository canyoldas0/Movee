//
//  EndpointHelper.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 21.06.2022.
//

import Foundation

enum EndpointHelper {
    
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey = "da341460ab89e31e92146f13adfbe54c"
    
    case popularMovies
    case topRatedMovies
    case movieDetail(Int)
    
    func getURL() -> URL {
        
        switch self {
        case .popularMovies:
            return URL(string: "\(EndpointHelper.baseURL)/movie/popular?api_key=\(EndpointHelper.apiKey)")!
        case .topRatedMovies:
            return URL(string: "\(EndpointHelper.baseURL)/movie/top_rated?api_key=\(EndpointHelper.apiKey)")!
        case .movieDetail(let id):
            return URL(string: "\(EndpointHelper.baseURL)/movie/\(id)?api_key=\(EndpointHelper.apiKey)")!
        }
    }
}
