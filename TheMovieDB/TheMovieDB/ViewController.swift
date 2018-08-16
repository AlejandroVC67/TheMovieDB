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
    var moviesImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        MovieDBFacade.RetrieveTopRated() { response in
            print(response)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    /*
    func loadImages() {
        let kImageURL = "https://image.tmdb.org/t/p/w500"
        for movie in self.movies {
            // print(movie["poster_path"]!)
            let imageUrl = URL(string: kImageURL + String(describing: movie["poster_path"]!))!
            let imageData = try! Data(contentsOf: imageUrl)
            self.moviesImages.append(UIImage(data: imageData)!)
        }
        collectionView.reloadData()
    } */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.movieImage.image = self.moviesImages[indexPath.item]
        return cell
    }
    
}

