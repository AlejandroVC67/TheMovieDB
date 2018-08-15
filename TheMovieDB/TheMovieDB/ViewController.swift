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
    static let kURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
    static let kResults = "results"
    var movies: [[String: Any]] = [[String: Any]]()
    
    let test = [#imageLiteral(resourceName: "iTunesArtwork"),#imageLiteral(resourceName: "iTunesArtwork"),#imageLiteral(resourceName: "iTunesArtwork"),#imageLiteral(resourceName: "iTunesArtwork")]
    
    let testImage: [UIImage] = [
        UIImage(named: "iTunesArtwork")!,
        UIImage(named: "iTunesArtwork")!,
        UIImage(named: "iTunesArtwork")!,
        UIImage(named: "iTunesArtwork")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        Alamofire.request(ViewController.kURL).responseJSON { response in
            if let responseJSON = response.result.value {
                let dataResults = responseJSON as! [String: Any]                 //  what's the difference between let data: Dictionary = responseJSON as! Dictionary<String, Any>
                let moviesData = dataResults[ViewController.kResults] as! [[String: Any]]
                self.movies = moviesData
                print(self.movies[0])
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.movieImage.image = test[indexPath.item]
        return cell
    }


}

