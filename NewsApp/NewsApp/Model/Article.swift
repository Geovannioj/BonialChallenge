//
//  Article.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

class Article: Codable {
    
    private weak var source: Source?
    private var author: String
    private var title: String
    private var description: String
    private var url: String
    private var urlImage: String
    private var publishedAt: String
    private var content: String
    
    init(source: Source,
         author:String,
         title: String,
         description: String,
         url: String,
         urlImage:String,
         publishedAt: String,
         content: String) {
        
        self.source = source
        self.title = title
        self.author = author
        self.description = description
        self.url = url
        self.urlImage = urlImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    func getSource() -> Source{
        return self.source!
    }
    func getAuthor() -> String {
        return self.author
    }
    func getTitle() -> String {
        return self.title
    }
    func getDescription() -> String {
        return self.description
    }
    func getURL() -> String {
        return self.url
    }
    func getURLImage() -> String {
        return self.urlImage
    }
    func getPublishedAt() -> String {
        return self.publishedAt
    }
    func getContent() -> String {
        return self.content
    }
    
    deinit {
        
    }
}
