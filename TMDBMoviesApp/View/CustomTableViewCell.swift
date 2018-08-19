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
    @IBOutlet weak var genereLabel: UILabel!
    var tappedOne: ((CustomTableViewCell) -> Void)?
    var tappedTwo: ((CustomTableViewCell) -> Void)?
    var tappedThree: ((CustomTableViewCell) -> Void)?
    var tappedMoreButton: ((CustomTableViewCell) -> Void)?

    func Configure(movies:[Movie],cellTag:Int,cellText:String)
    {
        moreButton.tag = cellTag
        genereLabel.text = cellText

        if(movies.count > 0)
        {
            let url1 = URL(string:"http://image.tmdb.org/t/p/w200/" + movies[0].photoURl)
            self.imageOne.kf.setImage(with: url1)
            self.imageOne.tag = 0
            
            let url2 = URL(string:"http://image.tmdb.org/t/p/w200/" + movies[1].photoURl)
            self.imageTwo.kf.setImage(with: url2)
            self.imageTwo.tag = 1

            let url3 = URL(string:"http://image.tmdb.org/t/p/w200/" + movies[2].photoURl)
            self.ImageThree.kf.setImage(with: url3)
            self.ImageThree.tag = 2

        }
        
        let tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(onTapScreenOne))
        imageOne.isUserInteractionEnabled = true
        imageOne.addGestureRecognizer(tapRecognizer1)
        
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(onTapScreenTwo))
        imageTwo.isUserInteractionEnabled = true
        imageTwo.addGestureRecognizer(tapRecognizer2)
        
        let tapRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(onTapScreenThree))
        ImageThree.isUserInteractionEnabled = true
        ImageThree.addGestureRecognizer(tapRecognizer3)
    }
    
    @objc func onTapScreenOne()
    {
        tappedOne?(self)
    }
    @objc func onTapScreenTwo()
    {
        tappedTwo?(self)
    }
    @objc func onTapScreenThree()
    {
        tappedThree?(self)
    }
    @IBAction func MoreButtonAction(_ sender: Any)
    {
        tappedMoreButton?(self)
    }
}

