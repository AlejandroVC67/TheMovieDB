//
//  MovieDataDecoder.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

struct Movie {
    let vote_average: Double
    let title: String
    let popularity: Double
    let poster_path: String!
    let backdrop_path: String!
    let overview: String
    let release_date: String
    
    init(json : Dictionary<String,Any>){
        let posterPath = json["poster_path"] != nil ? MovieDBFacade.kImagesURL + String(describing: json["poster_path"]!) : MovieDBFacade.kImagePlaceholder
        let backdropPath = json["backdrop_path"] != nil ? MovieDBFacade.kImagesURL + String(describing: json["backdrop_path"]!) : MovieDBFacade.kImagePlaceholder
        self.vote_average = json["vote_average"] as? Double ?? 0.0
        self.title = json["title"] as? String ?? ""
        self.popularity = json["popularity"] as? Double ?? 0.0
        self.poster_path = posterPath // String(describing: json["poster_path"]!)
        self.backdrop_path = backdropPath // String(describing: json["backdrop_path"]!)
        self.overview = json["overview"] as? String ?? ""
        self.release_date = json["release_date"] as? String ?? ""
    }
}

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return
            lhs.title == rhs.title &&
                lhs.popularity == rhs.popularity &&
                lhs.poster_path == rhs.poster_path &&
                lhs.backdrop_path == rhs.backdrop_path &&
                lhs.overview == rhs.overview &&
                lhs.release_date == rhs.release_date
    }
}


struct TopRated {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
    var movies: [Movie] = [Movie]()
    init(json : Dictionary<String,Any>){
        self.page = json["page"] as? Int ?? 0
        self.total_results = json["total_results"] as? Int ?? 0
        self.total_pages = json["total_pages"] as? Int ?? 0
        if let results = json["results"] as? [[String: Any]] {
            movies = results.map(Movie.init(json: ))            
        } else {
            movies = [Movie(json: Dictionary<String,Any>())]
        }
        self.results = movies
    }
}

