//
//  FetchPopularMoviesService.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/13/19.
//

import Foundation
import Alamofire

class FetchPopularMoviesService: NetworkManagerProtocol {
    var url = ""
    var headers: HTTPHeaders = [:]
    var parameters: [String : Any] = [:]
    let httpMethod = HTTPMethod.get
    let encoding: ParameterEncoding = URLEncoding.default
    let apiKey = Constants.apiKey
    
    init() {
        url = "popular"
        parameters = ["api_key": apiKey]
    }
}
