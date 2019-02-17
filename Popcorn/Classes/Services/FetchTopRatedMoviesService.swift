//
//  FetchTopRatedMoviesService.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/13/19.
//

import Foundation
import Alamofire

class FetchTopRatedMoviesService: NetworkManagerProtocol {
    var url = ""
    var headers: HTTPHeaders = [:]
    var parameters: [String : Any] = [:]
    let httpMethod = HTTPMethod.get
    let encoding: ParameterEncoding = URLEncoding.default
    let apiKey = Constants.apiKey
    
    init() {
        url = "top_rated"
        parameters = ["api_key": apiKey]
    }
}
