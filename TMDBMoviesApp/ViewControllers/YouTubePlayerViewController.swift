//
//  YouTubePlayerViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 22/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import  UIKit
import WebKit

class YouTubePlayerViewController: UIViewController{
    
    @IBOutlet weak var webwindow: WKWebView!
    var id : String = ""
    var result :[Trailer]=[Trailer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataManager = DataManager()
        dataManager.GetTrailer(urlType: EnumURLType.Trailer, movieId: id, completionHandler: { (result) in
            self.result = result
            var url = URL(string: "https://www.youtube.com/watch?v="+"SUXWAEX2jlg")!

            if(result.count > 0)
            {
                 url = URL(string: "https://www.youtube.com/watch?v="+self.result[0].key)!
            }

            
            self.webwindow.load(URLRequest(url: url))
            self.webwindow.allowsBackForwardNavigationGestures = true
       
        })

        
    }
}
