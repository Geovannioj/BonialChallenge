//
//  ViewController.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import Alamofire

class TopHeadlinesViewController: UIViewController {

    private var network: AlamofireManager?
    private let URLTOPHEADS = "https://newsapi.org/v2/top-headlines" //?country=us&apiKey=09b79be801fc4f35b6e48a8026ef5d7e
    private let NEWS_AMOUNT = 21
    
    var artitles: [Article]?
    private var articlesAmount = 6
    private let TOTAL_ARTICLES = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        network = AlamofireManager()
        network?.requestData(url: self.URLTOPHEADS, country: "us", amount: self.NEWS_AMOUNT, completion: { (information) in
//            if let info = information {
//                self.artitles?.append(info)
//            }
            print(information)
        })
        
//        if self.artitles!.count > 0 {
//            for article in self.artitles! {
//                print(article.getTitle())
//            }
//        }
    }


}

