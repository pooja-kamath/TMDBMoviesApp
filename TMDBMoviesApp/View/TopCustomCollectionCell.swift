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
    ///Outlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterLabel: UILabel!
    
    ///Configure the details from movie
    func Configure(movie:Movie)
    {
        let url = URL(string:"http://image.tmdb.org/t/p/w400/" + movie.backdropURl)
        self.posterImage.kf.setImage(with: url)
        self.posterLabel.text = movie.title
    }
    
    ///Configure Image view from url
    func ConfigureImage(path:String)
    {
        let url = URL(string:"http://image.tmdb.org/t/p/w400/" + path)
        self.posterImage.kf.setImage(with: url)
        self.posterLabel.isHidden = true
    }
    
    ///Configure Image view from movie
    func ConfigureImage(movie:Movie)
    {
        let url = URL(string:"http://image.tmdb.org/t/p/w400/" + movie.backdropURl)
        self.posterImage.kf.setImage(with: url)
    }
}
