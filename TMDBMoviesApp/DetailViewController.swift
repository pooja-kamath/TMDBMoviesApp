//
//  ViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    public var id :String = ""
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dataManager = DataManager()
        dataManager.GetDetail(urlType: EnumURLType.Details, pageNumber: 1, movieId: id) { (Movie) in
            print(Movie.title)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

