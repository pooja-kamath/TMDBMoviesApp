//
//  UrlManager.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
class UrlManager: NSObject
{
    let ApiKey : String
    init(apiKey :String)
    {
        ApiKey = apiKey
    }
    
    // MARK: Get Movies URL
    
    func GetLatestMovieURL() -> String
    {
       return  "https://api.themoviedb.org/3/movie/latest?api_key=\(ApiKey)&language=en-US"
    }
    
    func GetNowPlayingMoviesURL(pageNumber:Int) -> String {
        return "https://api.themoviedb.org/3/movie/now_playing?api_key=\(ApiKey)&language=en-US&page=\(pageNumber)"
    }
    
    func GetPopularMoviesURL(pageNumber:Int) -> String {
        return "https://api.themoviedb.org/3/movie/popular?api_key=\(ApiKey)&language=en-US&page=\(pageNumber)"
    }
    
    func GetTopRatedMoviesURL(pageNumber:Int) -> String {
        return "https://api.themoviedb.org/3/movie/top_rated?api_key=\(ApiKey)&language=en-US&page=\(pageNumber)"
    }
    
    func GetUpcomingMoviesURL(pageNumber:Int) -> String {
        return  "https://api.themoviedb.org/3/movie/upcoming?api_key=\(ApiKey)&language=en-US&page=\(pageNumber)"
    }
    
    // MARK: Movies Details URL
    
    func GetDetailsURL(movieId:String) -> String {
        return "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(ApiKey)&language=en-US"
    }
    func GetMoviePhotosURL(movieId:String) -> String {
        return "https://api.themoviedb.org/3/movie/\(movieId)/images?api_key=\(ApiKey)&language=en-US"
    }
    
    // MARK: Search URL
    
    func SearchMoviesURL(query:String,pageNumber:Int) -> String {
        return "https://api.themoviedb.org/3/search/movie?api_key=\(ApiKey)&language=en-US&query=\(query)&page=\(pageNumber)&include_adult=false"
    }
}
