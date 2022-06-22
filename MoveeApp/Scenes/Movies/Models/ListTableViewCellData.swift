//
//  ListTableViewCellData.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import Foundation

class ListTableViewCellData {
  
    private(set) var id: Int
    private(set) var title: String?
    private(set) var categories: String?
    private(set) var date: String?
    private(set) var score: Double?
    private(set) var imageUrl: String?
    
    init(id: Int? = nil, title: String? = nil, categories: String? = nil, date: String? = nil, score: Double? = nil, imageUrl: String? = nil) {
        self.id = id ?? 0
        self.title = title
        self.categories = categories
        self.date = date
        self.score = score
        self.imageUrl = imageUrl
    }
    
    init(movie: Movie) {
        self.id = movie.id ?? 0
        self.title = movie.title
        self.score = movie.voteAverage
        self.categories = movie.categories
        self.imageUrl = movie.imageUrl
        self.date = movie.releaseDate
    }
}
