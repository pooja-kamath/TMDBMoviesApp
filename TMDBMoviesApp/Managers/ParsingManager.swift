//
//  ParsingManager.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ParsingManager: NSObject
{
    //Parse Movie Data
    func ParseData(data:NSDictionary)->[Movie] {
        let jsonData = JSON(data)
        var moviesResult :[Movie] = [Movie]()
        if let movies = jsonData["results"].array {
            for movie in movies {
                let movieObj = Movie(json: movie)
                moviesResult.append(movieObj)
            }
        }
        return moviesResult
    }
    
    //Parse Movie detail
    func ParseDetail(data:NSDictionary)->Movie {
        let jsonData = JSON(data)
        let moviesResult :Movie =  Movie(json: jsonData)
        return moviesResult
    }
    
    //Parse Trailer Detail
    func ParseTrailer(data:NSDictionary)->[Trailer] {
        let jsonData = JSON(data)
        var trailerResult :[Trailer] = [Trailer]()
        if let trailers = jsonData["videos"]["results"].array {
            for trailer in trailers {
                let trailerObj = Trailer(json: trailer)
                 trailerResult.append(trailerObj)
            }
        }
        return trailerResult
    }
    
    //Parse Image Detail
    func ParseImages(data:NSDictionary)->[BackDrop]
    {
        let jsonData = JSON(data)
        var backDropResult :[BackDrop] = [BackDrop]()
        if let backdrops = jsonData["backdrops"].array {
            for backdrop in backdrops {
                let backdropObj = BackDrop(json: backdrop)
                backDropResult.append(backdropObj)
            }
        }
        return backDropResult
    }
}
