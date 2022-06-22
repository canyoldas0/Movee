//
//  DetailViewModel.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import Foundation

class DetailViewModel {
    
    private var id: Int
    private var detailAPI: DetailNetworkProtocol
    
    init(id:Int,
         detailAPI: DetailNetworkProtocol = DetailAPI()) {
        self.id = id
        self.detailAPI = detailAPI
    }
    
    
    func getDetailData(for contentType: ContentType?) {
        guard let contentType = contentType else {return}
       
        detailAPI.getDetailData(contentType: contentType,
                                contentId: id)
    }
    
}
