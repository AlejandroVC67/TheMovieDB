//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if UIDevice.current.userInterfaceIdiom == .pad {
                    print("ipad")
        } else {
            print("not ipad")
        }

        MovieDBFacade.retrieveTopRated { [weak self] response in
            self?.movies = response.results
            self?.collectionView.reloadData()
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
                self?.collectionView.reloadData()
            }
        }
    }
}


extension MovieCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        if let imageURL = URL(string: movies[indexPath.item].poster_path) {
            cell.movieImage.af_setImage(withURL: imageURL) //set image automatically when download compelete.
        }
        return cell
    }
}

extension MovieCollectionViewController: UITableViewDelegate, UITableViewDataSource {
    
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
