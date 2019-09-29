//
//  Source.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 29/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

class Source: Codable {
    
    private var id: String
    private var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    func getSourceID() -> String {
        return self.id
    }
    
    func getSourceName() -> String {
        return self.name
    }
    
    deinit {
        
    }
}
