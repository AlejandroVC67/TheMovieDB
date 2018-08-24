//
//  ListCell.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol ListCell: class {
    weak var movieLabel : UILabel! { get }
    weak var movieImageView : UIImageView! { get }
}
