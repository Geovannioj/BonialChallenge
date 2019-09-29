//
//  TopHeadLinesPresenter.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 29/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

class TopHeadLinesPresenter {
 
    private var network: AlamofireManager?
    private let URLTOPHEADS = "https://newsapi.org/v2/top-headlines"
    private let NEWS_AMOUNT = 21
    private let TOTAL_ARTICLES = 0
    private var articlesAmount = 6
    
    func getArticles() -> [Article] {
        var artitles: [Article] = []
        network = AlamofireManager()
        network?.requestData(url: self.URLTOPHEADS, country: "us", amount: self.NEWS_AMOUNT, completion: { (information) in
            artitles = information!
            
        })
        return artitles
    }
    
    
}
