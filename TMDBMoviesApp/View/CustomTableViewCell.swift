//
//  CustomTableViewCell.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 19/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import UIKit
class CustomTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var ImageThree: UIImageView!
    
    func Configure(movies:[Movie])
    {
        if(movies.count > 0)
        {
            let url1 = URL(string:"http://image.tmdb.org/t/p/w200/" + movies[0].photoURl)
            self.imageOne.kf.setImage(with: url1)
            let url2 = URL(string:"http://image.tmdb.org/t/p/w200/" + movies[1].photoURl)
            self.imageTwo.kf.setImage(with: url2)
            let url3 = URL(string:"http://image.tmdb.org/t/p/w200/" + movies[2].photoURl)
            self.ImageThree.kf.setImage(with: url3)
        }
    }
}
