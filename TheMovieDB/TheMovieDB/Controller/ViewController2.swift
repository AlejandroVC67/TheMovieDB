//
//  ViewController2.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/22/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    static private let kImageURL = "https://image.tmdb.org/t/p/w500"
    var moviesImages: [UIImage] = []
    var movies: [Movie] = []
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        MovieDBFacade.retrieveTopRated { [weak self] response in
            self?.movies = response.results
            self?.loadImages()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImages() {
        for movie in self.movies {
            let imageUrl = URL(string: ViewController2.kImageURL + movie.poster_path)!
            MovieDBFacade.downloadImages(kImageURL: imageUrl) { response in
                self.moviesImages.append(response)
                self.movieTableView.reloadData()
            }
        }
    }
}

extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.movieImageView.image = self.moviesImages[indexPath.item]
        // cell.movieLabel.text = self.movies[indexPath.item].title Need to fix the order of the array so the label gets the right title for the movie
        return cell
    }
}
