//
//  DetailViewModel.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import Foundation
import Combine
import CYBase

class DetailViewModel {
    
    private var id: Int
    private var detailAPI: DetailNetworkProtocol
    private var cancellables = Set<AnyCancellable>()
    
    private var viewState: ViewStateBlock?
    private var dataFormatter: DetailDataFormatterProtocol?
    
    
    private var detailData: DetailViewData? {
        didSet {
            viewState?(.done)
        }
    }
    
    init(id:Int,
         detailAPI: DetailNetworkProtocol = DetailAPI(),
         dataFormatter: DetailDataFormatterProtocol = DetailDataFormatter()) {
        self.id = id
        self.detailAPI = detailAPI
        self.dataFormatter = dataFormatter
    }
    
    func listenViewModel(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func getDetailData(for contentType: ContentType?) {
        guard let contentType = contentType else {return}
        
        let creditsPublisher = detailAPI.getCreditsData(contentType: contentType, contentId: id)
        let detailPublisher = detailAPI.getDetailData(contentType: contentType, contentId: id)
        
        creditsPublisher
            .zip(detailPublisher)
            .handleEvents(receiveOutput: { (creditsResponse, detailResponse) in
                self.detailData = self.dataFormatter?.formatResponse(contentType: contentType,
                                    credits: creditsResponse,
                                    detail: detailResponse)
            },
                          receiveCompletion: { _ in })
            .sink(receiveCompletion: { _ in },
                  receiveValue: { _ in })
            .store(in: &cancellables)
    }
    
    func getViewData() -> DetailViewData? {
        return detailData
    }
}
