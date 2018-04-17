//
//  WebServices.swift
//  GitRepos
//
//  Created by Mariam Issa on 4/16/18.
//  Copyright © 2018 Mariam Al Ethawy. All rights reserved.
//

import UIKit

class WebServices: NSObject {
    var session: URLSession
    
    
    override init() {
        let sessionConfig = URLSessionConfiguration.default
        
        self.session = URLSession(configuration: sessionConfig)
    }
    
    func getContents(fromUrl: String, completion: @escaping (Data)->Void, errorCompletion:@escaping (Error)->Void) ->Void {
        
        guard let gitUrl = URL(string: fromUrl) else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            if error != nil {
                errorCompletion(error!)
            } else {
                completion(data!)
            }
           
            }.resume()
    }
}
