//
//  MoreCollectionCell.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 20/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import UIKit
class MoreCollectionCell: UICollectionViewCell
{
        @IBOutlet weak var posterImageView: UIImageView!
    
    func Configure(movie:Movie)
    {
        let url = URL(string:"http://image.tmdb.org/t/p/w200/" + movie.photoURl)
        self.posterImageView.kf.setImage(with: url)
    }
}
