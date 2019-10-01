//
//  Source.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 29/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

class Source: Codable {
    
    //MARK: properties
    private var id: String
    private var name: String
    
    //MARK: constructor method
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    /**
     Method to get the source's ID
     - Returns: source's ID as String
     */
    func getSourceID() -> String {
        if self.id == "null" {
            return "'"
        } else {
            return self.id
        }
    }
    /**
     Method to get the name of the article's source
     - Returns: The name of the article's source as String
     */
    func getSourceName() -> String {
        if self.name == "null" {
            return ""
        } else {
            return self.name
        }
    }
    
    deinit {
        
    }
}
