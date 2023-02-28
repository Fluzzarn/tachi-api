//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/23/23.
//

import Foundation


struct Table: Codable {
    var isDefault: Bool
    var description: String
    var folders: [String]
    var game: String
    var inactive: Bool
    var tableID: String
    var title: String
    
    enum CodingKeys:  String, CodingKey {
        case isDefault = "default"
        case description
        case folders
        case game
        case inactive
        case tableID
        case title
    }
    
}
