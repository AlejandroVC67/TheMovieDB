//
//  MovieDBDelegateFacade.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/23/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol MovieListDelegate: class {
    func numberOfItems() -> Int
    func configure(cell: ListCell, atIndexPath: IndexPath)
    func chooseACell(atIndexPath: IndexPath)
}







