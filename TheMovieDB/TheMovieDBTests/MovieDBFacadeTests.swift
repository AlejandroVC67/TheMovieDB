//
//  MovieDBFacadeTests.swift
//  TheMovieDBTests
//
//  Created by Diego Alejandro Villa Cardenas on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import Alamofire
@testable import TheMovieDB

class MovieDBFacadeTests: XCTestCase {
    
    let topRated = TopRated(json: Dictionary<String,Any>())
    
    func testFacadeWithWrongURL() {
        MovieDBFacade.kURL = "holi.com"
        MovieDBFacade.retrieveTopRated { [weak self] (response, error) in
            XCTAssert(response == self?.topRated)
            XCTAssert(error == "error")
        }
    }
}
