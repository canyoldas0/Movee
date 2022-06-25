//
//  CreditsResponse.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import Foundation

struct CreditsResponse: Decodable {
    
    let cast: [Cast]?
    let crew: [Crew]?

}

struct Cast: Decodable {
    
    let id: Int?
    let knownFor: String?
    let name: String?
    let characterName: String?
    let profilePath: String?
    
    var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500\(profilePath ?? "")"
    }
    
    enum CodingKeys: String, CodingKey  {
        case id
        case name
        case knownFor = "known_for_department"
        case profilePath = "profile_path"
        case characterName = "character"
    }
}

struct Crew: Decodable {
    
    let id: Int?
    let knownFor: String?
    let profilePath: String?
    let job: String?
    let name: String?
    
    var isDirector: Bool {
        return job == "Director" || job == "Series Director"
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case knownFor = "known_for_department"
        case profilePath = "profile_path"
        case job
    }
}
