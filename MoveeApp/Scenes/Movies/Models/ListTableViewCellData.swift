//
//  ListTableViewCellData.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import Foundation

class ListTableViewCellData {
  
    private(set) var title: String?
    private(set) var categories: String?
    private(set) var date: String?
    private(set) var score: Double?
    private(set) var imageUrl: String?
    
    init(title: String? = nil, categories: String? = nil, date: String? = nil, score: Double? = nil, imageUrl: String? = nil) {
        self.title = title
        self.categories = categories
        self.date = date
        self.score = score
        self.imageUrl = imageUrl
    }
    
    init(movie: Movie) {
        self.title = movie.originalTitle
        self.score = movie.voteAverage
        self.categories = "Categories"
        self.imageUrl = movie.imageUrl
        self.date = movie.releaseDate
    }
    
}
