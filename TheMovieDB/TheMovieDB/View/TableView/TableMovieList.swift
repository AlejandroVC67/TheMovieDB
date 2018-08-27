//
//  TableMovieList.swift
//  TheMovieDB
//
//  Created by Diego Alejandro Villa Cardenas on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

class TableMovieList: UITableView, MovieList {
    var movieDelegate: MovieListDelegate?
    
    init() {
        super.init(frame: CGRect.zero, style: .plain)
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableMovieList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (movieDelegate?.numberOfItems())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! ListCell
        movieDelegate?.configure(cell: cell, atIndexPath: indexPath)
        return cell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieDelegate?.chooseACell(atIndexPath: indexPath)
    }
}


