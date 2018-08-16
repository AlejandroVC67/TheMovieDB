//
//  MovieDBFacade.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire

class MovieDBFacade {
    
    static func RetrieveTopRated (completion: @escaping (TopRated) -> Void) {
        MovieDBRetriver.RetrieveTopRatedMovies() { response in
            completion(TopRated(json: response))
        }
    }
}



