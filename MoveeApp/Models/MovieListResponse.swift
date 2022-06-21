//
//  MovieListResponse.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 21.06.2022.
//

import Foundation

struct MovieListResponse: Decodable {
    
    let results: [Movie]
}

struct Movie: Decodable, Hashable, Identifiable {
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle: String?
    let posterPath, releaseDate: String?
    let voteAverage: Double?
    
    var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath ?? "")"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    
    
    static func stub() -> Movie {
        return Movie(backdropPath: "neMZH82Stu91d3iqvLdNQfqPPyl.jpg",
                     genreIDS: [],
                     id: 1,
                     originalTitle: "The Lost City",
                     posterPath: "neMZH82Stu91d3iqvLdNQfqPPyl.jpg",
                     releaseDate: "2022-03-24",
                     voteAverage: 6.8)
    }
    
}
