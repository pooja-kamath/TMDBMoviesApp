//
//  ViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var overview: UITextView!
    @IBOutlet weak var budget: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var LoadingIndicatorVIew: UIView!
    @IBOutlet weak var watchTrailerButton: UIButton!
    
    @IBOutlet weak var MoviesContentView: UIView!
    @IBOutlet weak var moviesDetailScroll: UIScrollView!
    @IBOutlet weak var photosCollection: UICollectionView!
    public var id :String = ""
    var PhotosList :[BackDrop] = [BackDrop]()
    var movie : Movie = Movie()
    
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
            self.LoadingIndicatorVIew.isHidden = true
            self.movie = Movie
            
        }
        
        dataManager.GetImages(movieId: id, completionHandler: { (result) in
            self.PhotosList = result
            self.photosCollection.reloadData()
        })
        
        let layout = photosCollection?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize.init(width: (UIScreen.main.bounds.width), height: photosCollection.frame.height)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.moviesDetailScroll.contentSize = CGSize(width:self.view.frame.width,height:1000)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return PhotosList.count > 0 ? PhotosList.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let customcell = (collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath)) as! TopCustomCollectionCell
        if(PhotosList.count > 0)
        {
            customcell.ConfigureImage(path: PhotosList[indexPath.row].filePath)
        }
        else
        {
            customcell.ConfigureImage(movie: movie)
        }
        return customcell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "PlayTrailerSegue" )
        {
            (segue.destination as! YouTubePlayerViewController).id = movie.id
        }
    }

}

