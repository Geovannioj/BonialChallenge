//
//  Article.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SwiftyJSON

class Article: Codable {
    
    //MARK: - Class Properties
    private var source: Source
    private var author: String
    private var title: String
    private var description: String
    private var url: String
    private var urlImage: String
    private var publishedAt: String
    private var content: String
    
    //MARK: - Constructor method
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
    
    //MARK:- Class methods
    
    /**
     Method to get the source of the article
     
     - Returns: source class
     */
    func getSource() -> Source{
        return self.source
    }
    
    /**
     Method to get the author of the article
     - Returns: author as String
     */
    func getAuthor() -> String {
        if self.author == "null" {
            return ""
        } else {
            return self.author
        }
        
    }
    
    /**
     Method to get the article's title
     - Returns: title as a String
     */
    func getTitle() -> String {
        return self.title
    }
    
    /**
     Method to get the article's description
     - Returns: the description of the article as String
     */
    func getDescription() -> String {
        if self.description == "null" {
            return ""
        } else {
            return self.description
        }
    }
    
    /**
     Method to get the URL to access the article in it's origin
     - Returns: the urls to access the article in it's source
     */
    func getURL() -> String {
        if self.url == "null" {
            return ""
        } else {
            return self.url
        }
    }
    
    /**
     Method to get the URL of the article's image
     - Returns: the URL to get the article's image as String
     */
    func getURLImage() -> String {
        return self.urlImage
    }
    
    /**
     Method to get when the article as published
     - Returns: the data as string of the article's publishment
     */
    func getPublishedAt() -> String {
        if publishedAt == "null" {
            return ""
        } else {
            return self.publishedAt
        }
    }
    
    /**
     Method to retrive part of the article's content
     - Returns: Article's content as String
     */
    func getContent() -> String {
        if self.content == "null" {
            return ""
        } else {
            return self.content
        }
    }
    
    deinit {
        
    }
}
