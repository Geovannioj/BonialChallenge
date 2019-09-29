//
//  AlamofireManager.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager: NSObject {
    
    private var apiKey: String = "09b79be801fc4f35b6e48a8026ef5d7e"
    
    func requestData(url: String, country: String ,amount: Int, completion: @escaping (Article?) -> Void ) {
        Alamofire.request(url,
                          parameters:["country": country,"pageSize":amount],
                          headers:["x-api-key": self.apiKey])
        .responseJSON { response in
            guard response.result.isSuccess,
                let value = response.result.value else {
                    print("Something went wrong with the request")
                    completion(nil)
                    return
                }
            
            do {
                let decoder = JSONDecoder()
                let articles = try? decoder.decode(Article.self, from: value as! Data)
                completion(articles)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
