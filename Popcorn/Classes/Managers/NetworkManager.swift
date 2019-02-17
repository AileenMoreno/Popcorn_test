//
//  NetworkManager.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/5/19.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    var url: String { get }
    var headers: HTTPHeaders { get }
    var parameters: [String: Any] { get }
    var httpMethod: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

class NetworkManager {
    
    private var sessionManager: SessionManager!
    private var baseUrl: String = Constants.apiURL
    
    init(){
        sessionManager = SessionManager.default
    }
    
    func request<T: Decodable>(_ requestObject: NetworkManagerProtocol, responseType: T.Type, completion: @escaping (Any?, NSError?) -> Void) {
        if let request = sessionManager?.request(baseUrl + requestObject.url, method: requestObject.httpMethod, parameters: requestObject.parameters, encoding: requestObject.encoding, headers: requestObject.headers) {
            request.validate().responseJSON { response in
                print(response)
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        completion(try? JSONDecoder().decode(responseType, from: data), nil)
                    }else {
                        completion(nil, NSError(domain: "", code: 0, userInfo:[ "localizedDescription": "Error reading data"]))
                    }
                case .failure(let errorResult):
                    completion(nil, errorResult as NSError)
                }
            }
        }
    }
}

