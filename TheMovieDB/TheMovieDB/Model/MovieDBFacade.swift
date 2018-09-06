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
    static var currentPage = 0
    static let kResults = "results"
    static let kImagesURL = "https://image.tmdb.org/t/p/w500"
    static let kImagePlaceholder = "http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
    static var kURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page="
    
    static func retrieveTopRated (completion: @escaping (TopRated, String) -> Void) {
        MovieDBFacade.currentPage = MovieDBFacade.currentPage + 1
        let completePath = MovieDBFacade.kURL + "\(MovieDBFacade.currentPage)"
        Alamofire.request(completePath).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
                case .success:
                    if let responseJSON = response.result.value {
                        let dataResults = responseJSON as! [String: Any]
                        completion(TopRated(json: dataResults), "error" )
                    }
                case .failure:
                    completion(TopRated(json: Dictionary<String,Any>()), "error")
            }
        }
    }
}



