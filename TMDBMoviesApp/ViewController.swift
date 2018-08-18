//
//  ViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let u  = UrlManager(apiKey: "55957fcf3ba81b137f8fc01ac5a31fb5")
        let d = DataManager()
        let s = u.GetLatestMovieURL()
        d.GetData(url: s)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

