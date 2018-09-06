//
//  TheMovieDBTests.swift
//  TheMovieDBTests
//
//  Created by Alejandro Villa Cárdenas on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import XCTest
import Alamofire
@testable import TheMovieDB

class TheMovieDBTests: XCTestCase {
    let movie = Movie(json: Dictionary<String,Any>())
    let topRated = TopRated(json: Dictionary<String,Any>())
    func testMovieInitWithEmptyDictionary() {
        XCTAssert(movie.title == "")
        XCTAssert(movie.overview == "")
        XCTAssert(movie.popularity == 0.0)
        XCTAssert(movie.vote_average == 0.0)
        XCTAssert(movie.poster_path == MovieDBFacade.kImagePlaceholder)
        XCTAssert(movie.backdrop_path == MovieDBFacade.kImagePlaceholder)
    }
    
    func testTopRatedWithEmptyDictionary() {
        XCTAssert(topRated.page == 0)
        XCTAssert(topRated.total_pages == 0)
        XCTAssert(topRated.total_results == 0)
        XCTAssertEqual(topRated.results, [movie])
    }
    
    func testDetailViewControllerWithEmptyMovie() {
        let movieX: Movie?
        let detailVC = TheMovieDB.DetailViewController()
        // detailVC.movie = movie?
        // print(detailVC.movie)
        // XCTAssert(detailVC.movieOverviewLabel.text == "Not Available")
    }
}
