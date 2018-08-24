//
//  ViewController2.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/22/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController {
    
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 20.0 {
            MovieDBFacade.retrieveTopRated { [weak self] response in
                self?.movies.append(contentsOf: response.results)
                self?.movieTableView.reloadData()
            }
        }
    }
}

extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        if let imageURL = URL(string: movies[indexPath.item].poster_path!) {
            cell.movieImageView.af_setImage(withURL: imageURL) //set image automatically when download compelete.
            cell.movieLabel.text = movies[indexPath.item].title
        }
        return cell
    }
}
