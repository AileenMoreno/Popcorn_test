//
//  MovieManager.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/5/19.
//

import Foundation


class MovieManager {
    
    private let networkManager = NetworkManager()
    
    func fetchMovies(callback: @escaping (Menu?) -> ()) {

        let service = FetchMoviesService()
        networkManager.request(service,
                               responseType: Menu.self) { (response, error) in
            guard error == nil,
                                let list = response as? Menu else {
                callback(nil)
                return
            }
            callback(list)
        }
    }
    
    func fetchPopularMovies(callback: @escaping (Menu?) -> ()) {
        
        let service = FetchPopularMoviesService()
        networkManager.request(service,
                               responseType: Menu.self) { (response, error) in
            guard error == nil,
                let menu = response as? Menu else {
                    callback(nil)
                    return
            }
            callback(menu)
        }
    }
    
    func fetchTopRatedMovies(callback: @escaping (Menu?) -> ()) {
        
        let service = FetchTopRatedMoviesService()
        networkManager.request(service,
                               responseType: Menu.self) { (response, error) in
            guard error == nil,
                let list = response as? Menu else {
                    callback(nil)
                    return
            }
            callback(list)
        }
    }
}
