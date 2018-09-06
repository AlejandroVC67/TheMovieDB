//
//  InitialViewControllerTests.swift
//  TheMovieDBTests
//
//  Created by Diego Alejandro Villa Cardenas on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import Alamofire
@testable import TheMovieDB

class InitialViewControllerTests: XCTestCase {
   var initVC: InitialViewController!
    
    override func setUp() {
        super.setUp()
        
        // ---------------- testInitialVCDeviceRecognition ----------------
        // initVC.checkDevice()
        // initVC.setView()
        // (initVC.list as! UIView).frame = initVC.view.bounds
        // ---------------- end testInitialVCDeviceRecognition ----------------
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initVCIdentifier = "InitialViewController"
        initVC = storyboard.instantiateViewController(withIdentifier: initVCIdentifier) as! InitialViewController
        _ = initVC.view
    }
    
    func testInitVCView() {
        XCTAssertTrue(initVC.list != nil, "The view should be set")
    }
    
    func testInitVCDelegate() {
        XCTAssertTrue(initVC.list.movieDelegate != nil)
    }
    
    func testInitialVCDeviceRecognition() {
        /*
         if UIDevice.current.userInterfaceIdiom == .pad {
         let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
         XCTAssert(initVC.list == CollectionMovieList(layout: layout))
         } else {
         XCTAssert(initVC.list == TableMovieList())
         } */
    }
    
    override func tearDown() {
        initVC = nil
        super.tearDown()
    }
    

    
}
