//
//  DetailViewController2.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 9/4/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController {
    var movieTitleLabel: UILabel!
    var movieImage: UIImageView!
    var moviePopularityLabel: UILabel!
    var movieReleaseLabel: UILabel!
    var movieOverviewLabel: UILabel!
    var movie: Movie?
    // var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponents()
        self.view.addSubview(movieTitleLabel)
        self.view.addSubview(movieImage)
        self.view.addSubview(moviePopularityLabel)
        self.view.addSubview(movieReleaseLabel)
        self.view.addSubview(movieOverviewLabel)
        
       movieTitleLabel.text = movie?.title
       movieImage.af_setImage(withURL: URL(string: (movie?.backdrop_path)!)!)
       moviePopularityLabel.text = "Popularity: \(movie?.popularity ?? 00)"
       movieReleaseLabel.text = "Release date: \(movie?.release_date ?? "Not Available")"
       movieOverviewLabel.text = "\(movie?.overview ?? "Not Available")"
       // setUpCLayoutAnchors()
    }
    
    /*
    func setUpCLayoutAnchors() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        moviePopularityLabel.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseLabel.translatesAutoresizingMaskIntoConstraints = false
        movieOverviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let viewSafeAreaTrailingAnchor = view.safeAreaLayoutGuide.trailingAnchor
        let viewSafeAreaLeadingAnchor = view.safeAreaLayoutGuide.leadingAnchor
        
        let movieTitleTopAnchor = movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let movieTitleTrailingAnchor = movieTitleLabel.trailingAnchor.constraint(equalTo: viewSafeAreaTrailingAnchor)
        let movieTitleLeadingAnchor = movieTitleLabel.leadingAnchor.constraint(equalTo: viewSafeAreaLeadingAnchor)
        
        let movieImageTopAnchor = movieImage.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 10)
        let movieImageTrailingAnchor = movieImage.trailingAnchor.constraint(equalTo: viewSafeAreaTrailingAnchor)
        let movieImageLeadingAnchor = movieImage.leadingAnchor.constraint(equalTo: viewSafeAreaLeadingAnchor)
        let movieImageHeightAnchor = movieImage.heightAnchor.constraint(equalToConstant: 300)
        
        let moviePopularityTopAnchor = moviePopularityLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 1)
        let moviePopularityTrailingAnchor = moviePopularityLabel.trailingAnchor.constraint(equalTo: viewSafeAreaTrailingAnchor)
        let moviePopularityLeadingAnchor = moviePopularityLabel.leadingAnchor.constraint(equalTo: viewSafeAreaLeadingAnchor)
        
        let movieReleaseTopAnchor = movieReleaseLabel.topAnchor.constraint(equalTo: moviePopularityLabel.bottomAnchor, constant: 1)
        let movieReleaseTrailingAnchor = movieReleaseLabel.trailingAnchor.constraint(equalTo: viewSafeAreaTrailingAnchor)
        let movieReleaseLeadingAnchor = movieReleaseLabel.leadingAnchor.constraint(equalTo: viewSafeAreaLeadingAnchor)
        
        let movieOverviewTopAnchor = movieOverviewLabel.topAnchor.constraint(equalTo: movieReleaseLabel.bottomAnchor, constant: 5)
        let movieOverviewTrailingAnchor = movieOverviewLabel.trailingAnchor.constraint(equalTo: viewSafeAreaTrailingAnchor)
        let movieOverviewLeadingAnchor = movieOverviewLabel.leadingAnchor.constraint(equalTo: viewSafeAreaLeadingAnchor)
        
        
        let ipadLayout = [movieTitleTopAnchor,
                          movieTitleTrailingAnchor,
                          movieTitleLeadingAnchor,
                          movieImageTopAnchor,
                          movieImageTrailingAnchor,
                          movieImageLeadingAnchor,
                          movieImageHeightAnchor,
                          moviePopularityTopAnchor,
                          moviePopularityTrailingAnchor,
                          moviePopularityLeadingAnchor]
        
        let phoneLayout = [movieTitleTopAnchor,
                           movieTitleTrailingAnchor,
                           movieTitleLeadingAnchor,
                           movieImageTopAnchor,
                           movieImageTrailingAnchor,
                           movieImageLeadingAnchor,
                           movieImageHeightAnchor,
                           moviePopularityTopAnchor,
                           moviePopularityTrailingAnchor,
                           moviePopularityLeadingAnchor,
                           movieReleaseTopAnchor,
                           movieReleaseTrailingAnchor,
                           movieReleaseLeadingAnchor,
                           movieOverviewTopAnchor,
                           movieOverviewTrailingAnchor,
                           movieOverviewLeadingAnchor]
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            NSLayoutConstraint.activate(ipadLayout)
        } else {
            
            NSLayoutConstraint.activate(phoneLayout)
        }

    } */
    
    func initComponents () {
        // scrollView = UIScrollView()
        
        movieTitleLabel = UILabel()
        movieTitleLabel.font.withSize(20)
        movieTitleLabel.textAlignment = .center
        
        movieImage = UIImageView()
        
        moviePopularityLabel = UILabel()
        moviePopularityLabel.textAlignment = .center
        
        movieReleaseLabel = UILabel()
        movieReleaseLabel.textAlignment = .center
        
        movieOverviewLabel = UILabel()
        movieOverviewLabel.numberOfLines = 15
        movieOverviewLabel.font.withSize(16)
        movieOverviewLabel.textAlignment = .center
        
        
    }
}


