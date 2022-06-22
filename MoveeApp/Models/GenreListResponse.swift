//
//  GenreListResponse.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import Foundation

struct GenreListResponse: Decodable {
    
    let genres: [Genres]
}

struct Genres: Decodable {
    let id: Int
    let name: String
}
