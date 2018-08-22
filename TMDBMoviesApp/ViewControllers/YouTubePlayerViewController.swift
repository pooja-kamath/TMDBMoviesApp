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
    
    ///Outlets
    @IBOutlet weak var webwindow: WKWebView!
    
    ///Movie id
    var id : String = ""
    
    ///Result arrays
    var result :[Trailer]=[Trailer]()
    
    ///View did load
    ///Load data
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadData()
    }
    
    ///Load data from data manager
    func LoadData()
    {
        //Initialize data manager
        let dataManager = DataManager()
        
        //Get trailer key
        dataManager.GetTrailer(urlType: EnumURLType.Trailer, movieId: id, completionHandler: { (result) in
            self.result = result
            
            //Default url
            var url = URL(string: "https://www.youtube.com/watch?v="+"SUXWAEX2jlg")!
            
            if(result.count > 0)
            {
                url = URL(string: "https://www.youtube.com/watch?v="+self.result[0].key)!
            }
            
            //Load the page
            self.webwindow.load(URLRequest(url: url))
            self.webwindow.allowsBackForwardNavigationGestures = true
            
        })
    }
}
