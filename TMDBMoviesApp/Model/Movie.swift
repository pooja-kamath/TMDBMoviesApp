//
//  Movie.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 19/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import SwiftyJSON
class Movie: NSObject {
 
    var id:String
    var title:String
    var overView: String
    var photoURl:String
    var backdropURl:String
    var releaseDate:String
    var budget:Int
    var rating:Float
    var tagLine:String
    var video:Bool
    override init() {
        self.id = ""
        self.title = ""
        self.overView = ""
        self.photoURl = ""
        self.releaseDate = ""
        self.budget = 0
        self.rating = 0
        self.tagLine = ""
        self.backdropURl = ""
        self.video = false
    }
    
    init(json : JSON){
        self.id = json["id"].stringValue
        self.title = json["title"].stringValue
        self.overView = json["overview"].stringValue
        self.photoURl = json["poster_path"].stringValue
        self.backdropURl = json["backdrop_path"].stringValue
        self.releaseDate = json["release_date"].stringValue
        self.budget = json["budget"].intValue
        self.rating = json["vote_average"].floatValue
        self.tagLine = json["tagline"].stringValue
        self.video = json["video"].boolValue
    }

}
