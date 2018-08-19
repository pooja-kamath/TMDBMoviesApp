//
//  NetworkManager.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 18/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class NetworkManager: NSObject {
    func FetchData(url:String,completionHandler:@escaping (NSDictionary?) -> ()) -> Void
    {
        Alamofire.request(url).responseJSON { (responseData) -> Void in
            completionHandler(responseData.result.value as? NSDictionary)
        }
    }
}
