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
        self.vote_average = json["vote_average"] as? Double ?? 0.0
        self.title = json["title"] as? String ?? ""
        self.popularity = json["popularity"] as? Double ?? 0.0
        self.poster_path = "https://image.tmdb.org/t/p/w500" + String(describing: json["poster_path"]!)
        self.backdrop_path = "https://image.tmdb.org/t/p/w500" + String(describing: json["backdrop_path"]!)
        self.overview = json["overview"] as? String ?? ""
        self.release_date = json["release_date"] as? String ?? ""
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
        }
        self.results = movies
    }
}

