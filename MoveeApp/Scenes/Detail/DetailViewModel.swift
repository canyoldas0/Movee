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
    
    
    private var detailData: DetailViewData? {
        didSet {
            viewState?(.done)
        }
    }
    
    init(id:Int,
         detailAPI: DetailNetworkProtocol = DetailAPI()) {
        self.id = id
        self.detailAPI = detailAPI
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
                self.detailData = self.formatResponse(contentType: contentType,
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
    
    fileprivate func formatResponse(contentType: ContentType,
                                credits: CreditsResponse,
                                detail: ItemDetailResponse) -> DetailViewData {
        
        let castCellData = credits.cast?.compactMap({ cast in
            CastCollectionViewCellData(id: cast.id ?? 0,
                                       name: cast.name ?? "",
                                       imageUrl: cast.imageUrl)
        })
        let castData = CastCardViewData(items: castCellData)
        
        switch contentType {
        case .movie:
            return DetailViewData(viewData: [DetailViewCellData(imageUrl: detail.imageUrl,
                                                                score: detail.voteAverage,
                                                                title: detail.title,
                                                                categories: detail.categories,
                                                                lengthData: IconLabelPackData(viewType: .lengthLabel,
                                                                                              string: "\(detail.runtime ?? 0)"),
                                                                yearData: IconLabelPackData(viewType: .releaseDate,
                                                                                            string: "\(detail.releaseDate ?? "")"),
                                                                description: detail.overview,
                                                                directorData: LabelPackData(contentType: .movie,
                                                                                            string: credits.crew?.first(where: {$0.isDirector == true})?.name ?? "No data"),
                                                                castData: castData
                                                               )])
        case .tvSeries:
            return DetailViewData(viewData: [DetailViewCellData(imageUrl: detail.imageUrl,
                                                                score: detail.voteAverage,
                                                                title: detail.name,
                                                                categories: detail.categories,
                                                                lengthData: IconLabelPackData(viewType: .lengthLabel,
                                                                                              string: "\(detail.episodeRunTime?.first ?? 0)"),
                                                                yearData: IconLabelPackData(viewType: .seasonNumber,
                                                                                            string: "\(detail.getYears() ?? "")"),
                                                                description: detail.overview,
                                                                directorData: LabelPackData(contentType: .movie,
                                                                                            string: credits.crew?.first(where: {$0.isDirector == true})?.name ?? "No data"),
                                                                castData: castData
                                                               )])
        }
        
    }
}
