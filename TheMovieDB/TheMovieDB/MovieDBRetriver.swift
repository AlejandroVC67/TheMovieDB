//
//  MovieDBRetriver.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire
class MovieDBRetriver {
    static let kURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
    static let kResults = "results"
    static func RetrieveTopRatedMovies (completion: @escaping ([String: Any]) -> Void) {
        Alamofire.request(MovieDBRetriver.kURL).responseJSON { response in
            if let responseJSON = response.result.value {
                let dataResults = responseJSON as! [String: Any]
                completion(dataResults)
            }
        }
    }
}
