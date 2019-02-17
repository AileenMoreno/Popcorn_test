//
//  Menu.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/13/19.
//

import Foundation

struct Menu: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}
