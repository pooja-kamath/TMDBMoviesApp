//
//  ViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dataManager = DataManager()
        dataManager.GetData(urlType: EnumURLType.NowPlaying, completionHandler: { (data) in
           for movie in data {
            print(movie.id,movie.title,movie.photoURl)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

