//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    static private let kImageURL = "https://image.tmdb.org/t/p/w500"
    var moviesImages: [UIImage] = []
    var movies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
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
            let imageUrl = URL(string: ViewController.kImageURL + movie.poster_path)!
            MovieDBFacade.downloadImages(kImageURL: imageUrl) { response in
                self.moviesImages.append(response)
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.movieImage.image = self.moviesImages[indexPath.item]
        return cell
    }
    
}

