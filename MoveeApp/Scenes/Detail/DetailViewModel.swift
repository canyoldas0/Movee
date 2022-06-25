//
//  DetailViewModel.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import Foundation
import Combine

class DetailViewModel {
    
    private var id: Int
    private var detailAPI: DetailNetworkProtocol
    private var cancellables = Set<AnyCancellable>()
    
    
    // TODO: convert it DetailViewData
    private var detailData: ItemDetailResponse? {
        didSet {
            
        }
    }
    
    init(id:Int,
         detailAPI: DetailNetworkProtocol = DetailAPI()) {
        self.id = id
        self.detailAPI = detailAPI
    }
    
    
    func getDetailData(for contentType: ContentType?) {
        guard let contentType = contentType else {return}
        
        let creditsPublisher = detailAPI.getCreditsData(contentType: contentType, contentId: id)
        let detailPublisher = detailAPI.getDetailData(contentType: contentType, contentId: id)
        
        creditsPublisher
            .zip(detailPublisher)
            .handleEvents(receiveOutput: { (detailResponse, creditsResponse) in
//                self.moviesState?(.done)
                    print(creditsResponse)
            },
            receiveCompletion: { _ in })
            .sink(receiveCompletion: { _ in },
                  receiveValue: { _ in })
            .store(in: &cancellables)
    }
}
