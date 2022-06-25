//
//  DetailAPI.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import Foundation
import Combine

protocol DetailNetworkProtocol: AnyObject {
    
    func getDetailData(contentType: ContentType, contentId: Int) -> AnyPublisher<ItemDetailResponse, Error>
    func getCreditsData(contentType: ContentType, contentId: Int) -> AnyPublisher<CreditsResponse, Error>
}

class DetailAPI: DetailNetworkProtocol {
    
    func getDetailData(contentType: ContentType, contentId: Int) -> AnyPublisher<ItemDetailResponse, Error> {
        
        switch contentType {
        case .movie:
            return BaseAPI.shared.execute(EndpointHelper.movieDetail(contentId).getURL(),
                                   decodingType: ItemDetailResponse.self)
                                    
        case .tvSeries:
            return BaseAPI.shared.execute(EndpointHelper.seriesDetail(contentId).getURL(),
                                   decodingType: ItemDetailResponse.self)
                                    
        }
    }
    
    func getCreditsData(contentType: ContentType, contentId: Int) -> AnyPublisher<CreditsResponse, Error> {
        
        switch contentType {
        case .movie:
            return BaseAPI.shared.execute(EndpointHelper.movieCredits(contentId).getURL(),
                                          decodingType: CreditsResponse.self)
        case .tvSeries:
            return BaseAPI.shared.execute(EndpointHelper.seriesCredits(contentId).getURL(),
                                          decodingType: CreditsResponse.self)
        }
    }

}
