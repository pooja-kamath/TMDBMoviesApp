//
//  Backdrop.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 20/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import SwiftyJSON
class BackDrop: NSObject {
    
    //Backdrop image path
    var filePath:String
    
    override init() {
        self.filePath = ""
    }
    
    init(json : JSON)
    {
        self.filePath = json["file_path"].stringValue
    }
    
}
