//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/23/23.
//

import Foundation


public struct Table: Codable {
    public var isDefault: Bool
    public var description: String
    public var folders: [String]
    public var game: String
    public var inactive: Bool
    public var tableID: String
    public var title: String
    
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
