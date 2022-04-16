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
    private(set) var date: Date?
    private(set) var score: String?
    private(set) var imageUrl: String?
    
    init(title: String? = nil, categories: String? = nil, date: Date? = nil, score: String? = nil, imageUrl: String? = nil) {
        self.title = title
        self.categories = categories
        self.date = date
        self.score = score
        self.imageUrl = imageUrl
    }
    
    
}
