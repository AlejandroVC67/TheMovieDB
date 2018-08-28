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
        
        if UIDevice.current.userInterfaceIdiom == .pad { //   UIDevice.current.userInterfaceIdiom == .pad
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsetsMake(10, 1, 10, 1)
            layout.itemSize = CGSize(width: 245, height:340)
            self.list = CollectionMovieList(layout: layout)
        } else {
            self.list = TableMovieList()
        }
        self.list.movieDelegate = self
        self.view.addSubview((self.list as! UIView))
        MovieDBFacade.retrieveTopRated { [weak self] response in
            self?.movies = response.results
            self?.list.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (self.list as! UIView).frame = self.view.bounds
    }
    
    /*
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 20.0 {
            MovieDBFacade.retrieveTopRated { [weak self] response in
                self?.movies.append(contentsOf: response.results)
                self?.list.reloadData()
            }
        }
    } */
}

extension InitialViewController: MovieListDelegate {    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func configure(cell: ListCell, atIndexPath: IndexPath) {
        if let imageURL = URL(string: movies[atIndexPath.item].poster_path!) {
            cell.movieImageView?.af_setImage(withURL: imageURL) //set image automatically when download compelete.
            cell.movieLabel?.text = movies[atIndexPath.item].title
        }
    }
    func chooseACell(atIndexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.movie = movies[atIndexPath.item]
        self.navigationController!.pushViewController(detailViewController, animated: false)
    }
    
}
