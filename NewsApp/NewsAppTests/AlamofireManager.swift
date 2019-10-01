//
//  AlamofireManager.swift
//  NewsAppTests
//
//  Created by Geovanni Oliveira de Jesus on 01/10/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import XCTest

@testable import NewsApp

class TestAlamofireManager: XCTestCase {

    var  networkManager: AlamofireManager?
    var articlesGotten: [Article] = []
    let requestURl = "https://newsapi.org/v2/top-headlines"
    let country = "us"
    let amountOfdata = 21
    let page = 0
    
    override func setUp() {
        
        networkManager = AlamofireManager()
    }
    
    func testGetResponse () {
        
        networkManager?.requestData(url: requestURl,
                                    country: country,
                                    amount: amountOfdata,
                                    page: page,
                                    completion: { (articlesResponse) in
            XCTAssertNotNil(articlesResponse)
            self.waitForExpectations(timeout: 5.0, handler: nil)
        })
    }
    
    func testGetRequest () {
        
        networkManager?.requestData(url: requestURl,
                                    country: country,
                                    amount: amountOfdata,
                                    page: page,
                                    completion: { (articlesResponse) in
            self.articlesGotten += articlesResponse!
            XCTAssertNotNil(self.articlesGotten)
            self.waitForExpectations(timeout: 5.0, handler: nil)
        })
    }
}
