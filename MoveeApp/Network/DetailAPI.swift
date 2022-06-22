//
//  DetailAPI.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import Foundation

protocol DetailNetworkProtocol: AnyObject {
    
    func getDetailData(contentType: ContentType, contentId: Int)
}

class DetailAPI: DetailNetworkProtocol {
    
    func getDetailData(contentType: ContentType, contentId: Int) {
        
        switch contentType {
        case .movie:
            BaseAPI.shared.execute(EndpointHelper.movieDetail(contentId).getURL(),
                                   decodingType: MovieDetailResponse.self)
        case .tvSeries:
            break
//            urlString = EndpointHelper.
        }
        
        
    }
}
