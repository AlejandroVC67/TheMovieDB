//
//  MovieList.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol MovieList: class {
    weak var movieDelegate: MovieListDelegate? { get set }
    func reloadData()
    // func chooseACell(image: UIImageView!, title: String, overview: String, release: String, popularity: String, atIndexPath: IndexPath)
}

