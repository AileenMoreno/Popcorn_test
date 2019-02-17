//
//  Constants.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/13/19.
//

import Foundation
import UIKit

class Constants {
    static let apiURL = "https://api.themoviedb.org/3/movie/"
    static let apiImagesURL = "https://image.tmdb.org/t/p/w500"
    static let apiKey = "34738023d27013e6d1b995443764da44"
    
    struct CellIdentifiers {
        static let movieCollection = "movie-collection-view-cell"
    }
    
    struct Color {
        static let redMainColor = UIColor(red: 231/255,
                                      green: 76/255,
                                      blue: 60/255,
                                      alpha: 1)
    }
}
