//
//  CollectionMovieList.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

class CollectionMovieList: UICollectionView, MovieList {
    var movieDelegate: MovieListDelegate?
    
    init(layout: UICollectionViewLayout) {
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.dataSource = self
        self.delegate = self
        let nib = UINib(nibName: "CollectionMovieCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "CollectionMovieCell")

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionMovieList: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (movieDelegate?.numberOfItems())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionMovieCell", for: indexPath) as! ListCell
        movieDelegate?.configure(cell: cell, atIndexPath: indexPath)
        return cell as! UICollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieDelegate?.didSelectCell(atIndexPath: indexPath)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 {
            movieDelegate?.didReachEnd()
        }
    }
}
