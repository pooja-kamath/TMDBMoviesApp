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
    //API Key
    let ApiKey : String = "55957fcf3ba81b137f8fc01ac5a31fb5"

    //Get Data list of movies
    func GetData(urlType : EnumURLType,completionHandler:@escaping ([Movie]) -> (),pageNumber :Int = 1,movieId:String="",query:String="") -> Void
    {
        //Initialise URL manager
        let urlManager = UrlManager(apiKey: ApiKey)
        
        //Get the url
        let url = urlManager.GetURL(urlType: urlType,pageNumber: pageNumber,movieId: movieId,query: query)
        
        //Initialise network manager
        let networkmanager = NetworkManager()
        
        //Fetch data from network manager
        networkmanager.FetchData(url: url) 
        {
            (responseData) in
            if((responseData) != nil)
            {
                //Initialize parsing Manager
                let parser = ParsingManager()
                
                //Parse data recieved from network manager
                let data = parser.ParseData(data: responseData!)
                
                //Pass the data to completion handler
                completionHandler(data)
            }
            else
            {
                //Show error
            }
        }
        
    }
    
    //Get Details of movies
    func GetDetail(urlType : EnumURLType,pageNumber :Int,movieId:String,completionHandler:@escaping (Movie) -> ()) -> Void
    {
        //Initialise URL manager
        let urlManager = UrlManager(apiKey: ApiKey)
        
        //Get the url
        let url = urlManager.GetURL(urlType: urlType,pageNumber: pageNumber,movieId: movieId)
        
        //Initialise network manager
        let networkmanager = NetworkManager()
        
        //Fetch data from network manager
        networkmanager.FetchData(url: url)
        {
            
            (responseData) in
            if((responseData) != nil)
            {
                //Initialize parsing Manager
                let parser = ParsingManager()
                
                //Parse data recieved from network manager
                let data = parser.ParseDetail(data: responseData!)
                
                //Pass the data to completion handler
                completionHandler(data)
            }
            else
            {
                //Show error
            }
        }
        
    }
    //Get Images of movie
    func GetImages(movieId:String,completionHandler:@escaping ([BackDrop]) -> ()) -> Void
    {
        //Initialise URL manager
        let urlManager = UrlManager(apiKey: ApiKey)
        
        //Get the url
        let url = urlManager.GetURL(urlType:EnumURLType.Photos,movieId: movieId)
        
        //Initialise network manager
        let networkmanager = NetworkManager()
        
        //Fetch data from network manager
        networkmanager.FetchData(url: url)
        {
            (responseData) in
            if((responseData) != nil)
            {
                //Initialize parsing Manager
                let parser = ParsingManager()
                
                //Parse data recieved from network manager
                let data = parser.ParseImages(data: responseData!)
                
                //Pass the data to completion handler
                completionHandler(data)
            }
            else
            {
                //Show error
            }
        }
        
    }
    
    //Get trailers for the movies
    func GetTrailer(urlType : EnumURLType,movieId:String,completionHandler:@escaping ([Trailer]) -> ()) -> Void
    {
        
        //Initialise URL manager
        let urlManager = UrlManager(apiKey: ApiKey)
        
        //Get the url
        let url = urlManager.GetURL(urlType: urlType,movieId: movieId)
        
        //Initialise network manager
        let networkmanager = NetworkManager()
   
        //Fetch data from network manager
        networkmanager.FetchData(url: url)
        {
            (responseData) in
            if((responseData) != nil)
            {
                //Initialize parsing Manager
                let parser = ParsingManager()
                
                //Parse data recieved from network manager
                let data = parser.ParseTrailer(data: responseData!)
                
                //Pass the data to completion handler
                completionHandler(data)
            }
            else
            {
                //Show error
            }
        }
    }
}
