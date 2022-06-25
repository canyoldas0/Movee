//
//  TVSeriesDetailResponse.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 24.06.2022.
//

import Foundation

// MARK: - TVSeriesDetailResponse
struct ItemDetailResponse: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let createdBy: [CreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genres]?
    let homepage: String?
    let id: Int?
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: LastEpisodeToAir?
    let name: String?
    let networks: [Network]?
    let numberOfEpisodes, numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [Network]?
    let productionCountries: [ProductionCountry]?
    let seasons: [Season]?
    let spokenLanguages: [SpokenLanguage]?
    let status, tagline, type: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    // Movie Related Ones
    let belongsToCollection: BelongsToCollection?
    let budget: Int?
    let imdbID, originalTitle: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let title: String?
    
    var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")"
    }
    
    var categories: String? {
        let temp = genres?.compactMap { $0.name }
        return temp?.joined(separator: ", ")
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case createdBy
        case episodeRunTime
        case firstAirDate
        case genres, homepage, id
        case inProduction
        case languages
        case lastAirDate
        case lastEpisodeToAir
        case name
        case networks
        case numberOfEpisodes
        case numberOfSeasons
        case originCountry
        case originalLanguage
        case originalName
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies
        case productionCountries
        case seasons
        case spokenLanguages
        case status, tagline, type
        case voteAverage
        case voteCount
        
        case belongsToCollection
        case budget
        case imdbID, originalTitle
        case releaseDate = "release_date"
        case revenue, runtime
        case title
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let id: Int?
    let creditID, name: String?
    let gender: Int?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case creditID
        case name, gender
        case profilePath
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int?
    let name, posterPath, backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath
        case backdropPath
    }
}

// MARK: - LastEpisodeToAir
struct LastEpisodeToAir: Codable {
    let airDate: String?
    let episodeNumber, id: Int?
    let name, overview, productionCode: String?
    let runtime, seasonNumber: Int?
    let stillPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate
        case episodeNumber
        case id, name, overview
        case productionCode
        case runtime
        case seasonNumber
        case stillPath
        case voteAverage
        case voteCount
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName
        case iso639_1
        case name
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1
        case name
    }
}

// MARK: - Network
struct Network: Codable {
    let name: String?
    let id: Int?
    let logoPath: String?
    let originCountry: String?
    let logo: Logo?

    enum CodingKeys: String, CodingKey {
        case name, id
        case logoPath
        case originCountry
        case logo
    }
}

// MARK: - Logo
struct Logo: Codable {
    let path: String?
    let aspectRatio: Double?

    enum CodingKeys: String, CodingKey {
        case path
        case aspectRatio
    }
}


// MARK: - Season
struct Season: Codable {
    let airDate: String?
    let episodeCount, id: Int?
    let name, overview, posterPath: String?
    let seasonNumber: Int?
    let networks: [Network]?

    enum CodingKeys: String, CodingKey {
        case airDate
        case episodeCount
        case id, name, overview
        case posterPath
        case seasonNumber
        case networks
    }
}

extension ItemDetailResponse {
    
    func getYears() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.yyyyMMdd.rawValue
        guard let firstDate = dateFormatter.date(from: self.firstAirDate ?? ""),
              let secondDate = dateFormatter.date(from: self.lastAirDate ?? "") else {return nil}
    
        if let inProduction = inProduction,
                inProduction {
            return "\(firstDate.get(.year)) - "
        }
        return "\(firstDate.get(.year)) - \(secondDate.get(.year)) "
    }
}
