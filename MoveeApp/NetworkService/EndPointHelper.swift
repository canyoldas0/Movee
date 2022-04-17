//
//  File name: EndPointHelper.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation
import CYBase

typealias BaseUrl = EndpointHelper.BaseUrls
typealias Path = EndpointHelper.Paths


enum EndpointHelper {
    
    enum BaseUrls: String {
        case base = "https://api.themoviedb.org/3/"
    }
    
    enum Paths: CYValueProtocol {
        
        typealias Value = String
        
        var value: String {
            switch self {
            case .popularMovies:
                return "movie/popular"
            case .nowPlayingMovies:
                return "movie/now_playing"
            }
        }
        
        case popularMovies
        case nowPlayingMovies
    }
}
   


