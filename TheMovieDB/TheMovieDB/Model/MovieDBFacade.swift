//
//  MovieDBFacade.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class MovieDBFacade {
    // static private let kURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
    static var currentPage = 0
    static private let kResults = "results"
    static private let kImagesURL = "https://image.tmdb.org/t/p/w500"
    
    
    static func retrieveTopRated (completion: @escaping (TopRated) -> Void) {
        MovieDBFacade.currentPage = MovieDBFacade.currentPage + 1
        let kURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=\(MovieDBFacade.currentPage)"
        Alamofire.request(kURL).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
                case .success:
                    if let responseJSON = response.result.value {
                        let dataResults = responseJSON as! [String: Any]
                        completion(TopRated(json: dataResults))
                    } else {
                        print("Couldn't get data")
                    }
                case .failure(let error):
                    print(error)
            }

        }
    }
}



