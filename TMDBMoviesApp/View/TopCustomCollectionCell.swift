//
//  TopCustomCollectionCell.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 19/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class TopCustomCollectionCell: UICollectionViewCell
{
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterLabel: UILabel!
    
    func Configure(movie:Movie)
    {
        let url = URL(string:"http://image.tmdb.org/t/p/w200/" + movie.photoURl)
        self.posterImage.kf.setImage(with: url)
        self.posterLabel.text = movie.title
    }
}
