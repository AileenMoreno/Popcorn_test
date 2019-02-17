//
//  Movie.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/5/19.
//

import Foundation

struct Movie: Decodable {
    let movieID: Int
    let video: Bool
    let voteCount: Int
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: String
    let originalTitle: String
    let generes: [Int]
    let backdropPath: String
    let adult: Bool
    let overview: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case generes = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
}
