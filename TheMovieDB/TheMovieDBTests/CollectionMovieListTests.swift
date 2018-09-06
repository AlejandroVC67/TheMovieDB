//
//  CollectionMovieListTests.swift
//  TheMovieDBTests
//
//  Created by Diego Alejandro Villa Cardenas on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import Alamofire
@testable import TheMovieDB

class CollectionMovieListTests: XCTestCase {
    var movieCollection: CollectionMovieList!
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func setUp() {
        movieCollection = CollectionMovieList(layout: layout)
    }
    
    func testCollectionMovieDelegate() {
        // XCTAssertTrue(movieCollection.movieDelegate != nil)
    }
    
    
}
