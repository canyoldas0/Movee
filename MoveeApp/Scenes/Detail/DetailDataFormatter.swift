//
//  DetailDataFormatter.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 26.06.2022.
//

import Foundation

protocol DetailDataFormatterProtocol: AnyObject {
    func formatResponse(contentType: ContentType,
                        credits: CreditsResponse,
                        detail: ItemDetailResponse) -> DetailViewData
    
}

class DetailDataFormatter: DetailDataFormatterProtocol {
    
    func formatResponse(contentType: ContentType,
                        credits: CreditsResponse,
                        detail: ItemDetailResponse) -> DetailViewData {
        switch contentType {
        case .movie:
            return convertForMovie(credits: credits, detail: detail)
        case .tvSeries:
            return convertForSeries(credits: credits, detail: detail)
        }
    }
    
    private func convertForMovie(credits: CreditsResponse, detail: ItemDetailResponse) -> DetailViewData {
        let castCellData = credits.cast?.compactMap({ cast in
            CastCollectionViewCellData(id: cast.id ?? 0,
                                       name: cast.name ?? "",
                                       imageUrl: cast.imageUrl)
        })
        let castData = CastCardViewData(title: "Casts", items: castCellData)
        
        return DetailViewData(detailData: [DetailViewCellData(imageUrl: detail.imageUrl,
                                                            score: detail.voteAverage,
                                                            title: detail.title,
                                                            categories: detail.categories,
                                                            lengthData: IconLabelPackData(viewType: .lengthLabel,
                                                                                          string: "\(detail.runtime ?? 0)"),
                                                            yearData: IconLabelPackData(viewType: .releaseDate,
                                                                                        string: "\(detail.releaseDate ?? "")"),
                                                            description: detail.overview,
                                                            directorData: LabelPackData(contentType: .movie,
                                                                                        string: credits.crew?.first(where: {$0.isDirector == true})?.name ?? "No data"))], castData: [castData])
                                                          
    }
    
    private func convertForSeries(credits: CreditsResponse, detail: ItemDetailResponse) -> DetailViewData {
        let castCellData = credits.cast?.compactMap({ cast in
            CastCollectionViewCellData(id: cast.id ?? 0,
                                       name: cast.name ?? "",
                                       imageUrl: cast.imageUrl)
        })
        let castData = CastCardViewData(title: "Casts", items: castCellData)
        
        
        return DetailViewData(detailData: [DetailViewCellData(imageUrl: detail.imageUrl,
                                                            score: detail.voteAverage,
                                                            title: detail.name,
                                                            categories: detail.categories,
                                                            lengthData: IconLabelPackData(viewType: .lengthLabel,
                                                                                          string: "\(detail.episodeRunTime?.first ?? 0)"),
                                                            yearData: IconLabelPackData(viewType: .seasonNumber,
                                                                                        string: "\(detail.getYears() ?? "")"),
                                                            description: detail.overview,
                                                            directorData: LabelPackData(contentType: .movie,
                                                                                        string: credits.crew?.first(where: {$0.isDirector == true})?.name ?? "No data"))],
                                                            castData: [castData])
    }
    
}
