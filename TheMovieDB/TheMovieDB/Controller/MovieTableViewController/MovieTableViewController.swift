//
//  ViewController2.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/22/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController {
    
    static private let kImageURL = "https://image.tmdb.org/t/p/w500"
    var movies: [Movie] = []
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        MovieDBFacade.retrieveTopRated { [weak self] response in
            self?.movies = response.results
            self?.movieTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        if let imageURL = URL(string: MovieTableViewController.kImageURL + movies[indexPath.item].poster_path) {
            cell.movieImageView.af_setImage(withURL: imageURL) //set image automatically when download compelete.
            cell.movieLabel.text = movies[indexPath.item].title
        }
        return cell
    }
}
