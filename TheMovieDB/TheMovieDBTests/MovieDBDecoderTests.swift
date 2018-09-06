//
//  MovieDBDecoderTests.swift
//  TheMovieDBTests
//
//  Created by Diego Alejandro Villa Cardenas on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import Alamofire
@testable import TheMovieDB

class MovieDBDecoderTests: XCTestCase {
    
    let movie = Movie(json: Dictionary<String,Any>())
    let topRated = TopRated(json: Dictionary<String,Any>())
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testMovieInitWithEmptyDictionary() {
        XCTAssert(movie.title == "Not Available")
        XCTAssert(movie.overview == "Not Available")
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
    
}
