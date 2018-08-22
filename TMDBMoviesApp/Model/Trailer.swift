//
//  Trailer.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 22/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import SwiftyJSON
class Trailer: NSObject
{
    //Trailer key
    var key:String
    
    override init() {
        self.key = ""
    }
    
    init(json : JSON){
        self.key = json["key"].stringValue
    }
    
}
