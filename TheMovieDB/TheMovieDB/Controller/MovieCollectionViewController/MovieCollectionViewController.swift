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
    static private let kImageURL = "https://image.tmdb.org/t/p/w500"
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        MovieDBFacade.retrieveTopRated { [weak self] response in
            self?.movies = response.results
            self?.collectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MovieCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        if let imageURL = URL(string: MovieCollectionViewController.kImageURL + movies[indexPath.item].poster_path) {
            cell.movieImage.af_setImage(withURL: imageURL) //set image automatically when download compelete.
        }
        return cell
    }
}
