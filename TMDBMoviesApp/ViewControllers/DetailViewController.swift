//
//  ViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var overview: UITextView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var budget: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var LoadingIndicatorVIew: UIView!
    
    @IBOutlet weak var MoviesContentView: UIView!
    @IBOutlet weak var moviesDetailScroll: UIScrollView!
    public var id :String = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let dataManager = DataManager()
        dataManager.GetDetail(urlType: EnumURLType.Details, pageNumber: 1, movieId: id) { (Movie) in
            self.movieName.text = Movie.title
            self.overview.text = Movie.overView
            self.movieDate.text = Movie.releaseDate
            self.budget.text = String(Movie.budget)
            self.rating.text = String(Movie.rating)
            self.tagline.text = Movie.tagLine
            let url = URL(string:"http://image.tmdb.org/t/p/w500/" + Movie.photoURl)
            self.posterImage.kf.setImage(with: url)
            self.LoadingIndicatorVIew.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.moviesDetailScroll.contentSize = CGSize(width:self.view.frame.width,height:1000)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

