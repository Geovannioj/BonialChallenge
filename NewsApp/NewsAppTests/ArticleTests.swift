//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    var article:Article?
    var source: Source?
    
    override func setUp() {
        source = Source(id: "001", name: "newsJournal")
        self.article = Article(source: self.source!,
                               author: "Geovanni",
                               title: "How Unit test can prevent production errors",
                               description: "Unit tests have the power of preveting erros while the in the development environement",
                               url: "www.google.com",
                               urlImage: "www.image.com.br",
                               publishedAt: "NewsJournal",
                               content: "Unit tests have the power of preveting erros while the in the development environement, that's why it is needed")
    }

    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testArticleNotNull() {
        XCTAssertNotNil(self.article)
    }
    
    func testArticleTitle() {
        XCTAssertEqual(self.article?.getTitle(), "How Unit test can prevent production errors")
    }
    
    func testArticleAuthor() {
        XCTAssertEqual(self.article?.getAuthor(), "Geovanni")
    }
    
    func testDescription() {
        XCTAssertEqual(self.article?.getDescription(),
                       "Unit tests have the power of preveting erros while the in the development environement")
    }
    
    func testArticleURL() {
        XCTAssertEqual(self.article?.getURL(), "www.google.com")
    }
    
    func testArticleUrlImage() {
        XCTAssertEqual(self.article?.getURLImage(), "www.image.com.br")
    }
    
    func testPublishedPlace() {
        XCTAssertEqual(self.article?.getPublishedAt(), "NewsJournal")
    }
    
    func testArticleContent() {
        XCTAssertEqual(self.article?.getContent(),
                       "Unit tests have the power of preveting erros while the in the development environement, that's why it is needed")
    }

}
