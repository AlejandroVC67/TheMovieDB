//
//  DetailViewControllerTests.swift
//  TheMovieDBTests
//
//  Created by Diego Alejandro Villa Cardenas on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import Alamofire
@testable import TheMovieDB

class DetailViewControllerTests: XCTestCase {
    var detailVC: DetailViewController!
    override func setUp() {
        super.setUp()
        // ---------------- testDetailViewControllerWithEmptyMovie ----------------
        // detailVC.movie = movie
        /*
         let detailVCIdentifier = "DetailViewController"
         detailVC = storyboard.instantiateViewController(withIdentifier: detailVCIdentifier) as! DetailViewController
         _ = detailVC.view */
        // ---------------- end testDetailViewControllerWithEmptyMovie ----------------
    }
    
    func testDetailViewControllerWithEmptyMovie() {
        /*
         let movieX: Movie! = Movie(json: Dictionary<String,Any>())
         detailVC.movie = movieX!
         // print(detailVC.movie.title)
         // detailVC.setComponentsValues()
         detailVC.movieTitleLabel.text = detailVC.movie.title
         print(detailVC.movieTitleLabel.text)
         XCTAssert(detailVC.movieOverviewLabel.text == "Not Available") */
    }
    
}
