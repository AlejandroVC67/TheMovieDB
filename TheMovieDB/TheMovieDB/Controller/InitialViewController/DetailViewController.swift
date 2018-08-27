//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieReleaseLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitleLabel.text = movie?.title
        movieImage.af_setImage(withURL: URL(string: (movie?.poster_path)!)!)
        moviePopularityLabel.text = "Popularity: \(movie?.popularity ?? 00)"
        movieReleaseLabel.text = "Release date: \(movie?.release_date ?? "Not Available")"
        movieOverviewLabel.text = "Overview: \(movie?.overview ?? "Not Available")"
    }
}
