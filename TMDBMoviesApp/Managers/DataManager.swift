//
//  DataManager.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class DataManager: NSObject
{
    let ApiKey : String = "55957fcf3ba81b137f8fc01ac5a31fb5"

    func GetData(urlType : EnumURLType,completionHandler:@escaping ([Movie]) -> (),pageNumber :Int = 1,movieId:String="",query:String="") -> Void
    {
        let urlManager = UrlManager(apiKey: ApiKey)
        let url = urlManager.GetURL(urlType: urlType,pageNumber: pageNumber,movieId: movieId,query: query)
        
        let networkmanager = NetworkManager()
        networkmanager.FetchData(url: url) 
        {
            (responseData) in
            if((responseData) != nil)
            {
                let parser = ParsingManager()
                let data = parser.ParseData(data: responseData!)
                completionHandler(data)
            }
            else
            {
                //Show error
            }
        }
        
    }
    
    
}
