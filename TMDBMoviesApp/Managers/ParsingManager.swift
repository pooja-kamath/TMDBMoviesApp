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
    func ParseJson(json:JSON) ->[Movie]{
        var moviesResult :[Movie] = [Movie]()
        if let movies = json["results"].array {
            for movie in movies {
                let movieObj = Movie(json: movie)
                moviesResult.append(movieObj)
            }
        }
        return moviesResult
    }
    
    func ParseData(data:NSDictionary)->[Movie] {
        let jsonData = JSON(data)
        return ParseJson(json: jsonData)
    }
}
