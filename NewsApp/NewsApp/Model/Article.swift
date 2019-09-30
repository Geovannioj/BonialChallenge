//
//  Article.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

class Article: Codable {
    
    private var source: Source
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
        return self.source
    }
    func getAuthor() -> String {
        if self.author == "null" {
            return ""
        } else {
            return self.author
        }
        
    }
    func getTitle() -> String {
        return self.title
    }
    func getDescription() -> String {
        if self.description == "null" {
            return ""
        } else {
            return self.description
        }
    }
    func getURL() -> String {
        if self.url == "null" {
            return ""
        } else {
            return self.url
        }
    }
    func getURLImage() -> String {
        return self.urlImage
    }
    func getPublishedAt() -> String {
        if publishedAt == "null" {
            return ""
        } else {
            return self.publishedAt
        }
    }
    func getContent() -> String {
        if self.content == "null" {
            return ""
        } else {
            return self.content
        }
    }
    
    func returnCompleteArticle() -> String {
        let title = getTitle()
        let description = getDescription()
        return "\(title) \n \(description)"
    }
    
    deinit {
        
    }
}
