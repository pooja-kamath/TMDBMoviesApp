//
//  SearchTableViewCell.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 22/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewCell: UITableViewCell
{
    ///Outlets
    @IBOutlet weak var posterIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    ///Configure cell details
    func Configure(movie:Movie)
    {
        let url = URL(string:"http://image.tmdb.org/t/p/w400/" + movie.photoURl)
        self.posterIV.kf.setImage(with: url)
        self.titleLabel.text = movie.title
        self.overviewLabel.text = movie.overView

    }
}
