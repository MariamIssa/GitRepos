//
//  DataLayer.swift
//  GitRepos
//
//  Created by Mariam Issa on 4/16/18.
//  Copyright © 2018 Mariam Al Ethawy. All rights reserved.
//

import UIKit

class DataLayer: NSObject {
    var arrayData: [Any]
    var services: WebServices
    
    override init() {
        self.arrayData = []
        self.services = WebServices()
        
        super.init()
    }
    
    public func setUp(completion: @escaping ()->Void) ->Void {
        self.services.getContents(fromUrl: "https://api.github.com/users/apple/repos?per_page=10", completion: { (data) in
            
            self.arrayData = Array(data)
            
            if let json:[[String: Any]] = try? JSONSerialization.jsonObject(with: data, options: [.mutableLeaves]) as! [[String: Any]]{
               
                self.arrayData = json
                
                completion()
            }
        }) { (error) in
            print(error)
        }
    }
    
   public func numberOfItems() -> Int {
       return self.arrayData.count
    }
    
   public func itemForIndex(index: Int) -> GitHub {
        var gitHub : GitHub = GitHub()
        
        if let dict: [String: Any] = self.arrayData[index] as? [String: Any] {
            gitHub.name = dict["name"] as? String
            gitHub.description = dict["description"] as? String
        }
        
        return gitHub
    }
    
}
