//
//  InitialViewController.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/23/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var movies: [Movie] = []
    var list: MovieList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDevice()
        setView()
        retrieveTopRatedMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (self.list as! UIView).frame = self.view.bounds
    }
    
    func checkDevice() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsetsMake(10, 1, 10, 1)
            layout.itemSize = CGSize(width: 245, height:340)
            self.list = CollectionMovieList(layout: layout)
        } else {
            self.list = TableMovieList()
        }
    }
    
    func retrieveTopRatedMovies() {
        MovieDBFacade.retrieveTopRated { [weak self] (response, error) in
            self?.movies = response.results
            self?.list.reloadData()
        }
    }
    
    func setView() {
        self.list.movieDelegate = self
        self.view.addSubview((self.list as! UIView))
    }
}

extension InitialViewController: MovieListDelegate {
    func didReachEnd() {
        MovieDBFacade.retrieveTopRated { [weak self] (response, error) in
            self?.movies.append(contentsOf: response.results)
            self?.list.reloadData()
        }
    }
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func configure(cell: ListCell, atIndexPath: IndexPath) {
        if let imageURL = URL(string: movies[atIndexPath.item].poster_path!) {
            cell.movieImageView?.af_setImage(withURL: imageURL) //set image automatically when download compelete.
            cell.movieLabel?.text = movies[atIndexPath.item].title
        }
    }
    func didSelectCell(atIndexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.movie = movies[atIndexPath.item]
        self.navigationController!.pushViewController(detailViewController, animated: true)
        /*
        let detailViewController2 = storyboard?.instantiateViewController(withIdentifier: "DetailViewController2") as! DetailViewController2
        detailViewController2.movie = movies[atIndexPath.item]
        self.navigationController!.pushViewController(detailViewController2, animated: true) */
    }
    
}
