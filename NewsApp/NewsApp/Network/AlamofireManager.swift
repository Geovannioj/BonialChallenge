//
//  AlamofireManager.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamofireManager: NSObject {
    
    private var apiKey: String = "09b79be801fc4f35b6e48a8026ef5d7e"
    
    /***
     Method to get the data from the News API
     parameter url: url to the API's endpoint
     parameter country: country to get the specific news from there
     parameter amount: amount of news that will be loaded
     
     ***/
    func requestData(url: String, country: String ,amount: Int, completion: @escaping ([Article]?) -> Void ) {
        var articlesArray: [Article] = []
        
        Alamofire.request(url,
                          parameters:["country": country,"pageSize":amount],
                          headers:["x-api-key": self.apiKey])
        .responseJSON { response in
            
            if let repsonseValue = response.result.value {
                let jsonResponse = JSON(repsonseValue)
                
                //JSON atriutes extraction to create the Article Ojbect
                for articleItem in jsonResponse["articles"] {
                    
                    let sourceID = String(describing:articleItem.1["source"]["id"])
                    let sourceName = String(describing:articleItem.1["source"]["name"])
                    let source = Source(id: sourceID, name: sourceName)
                    
                    let author = String(describing:articleItem.1["author"])
                    let title = String(describing:articleItem.1["title"])
                    let description = String(describing:articleItem.1["description"])
                    let url = String(describing:articleItem.1["url"])
                    let urlImage = String(describing:articleItem.1["urlToImage"])
                    let publishedAt = String(describing:articleItem.1["publishedAt"])
                    let content = String(describing:articleItem.1["content"])
                    
                    let article = Article(source: source,
                                          author: author,
                                          title: title,
                                          description: description,
                                          url: url,
                                          urlImage: urlImage,
                                          publishedAt: publishedAt,
                                          content: content)
                    articlesArray.append(article)
                }
                completion(articlesArray)
            
            }
        }
    }
}
