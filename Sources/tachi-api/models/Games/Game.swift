//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/23/23.
//

import Foundation


public struct Game: Codable, Hashable {
    public var name: String
    public var playtypes: [String]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.playtypes = try container.decode([String].self, forKey:  .playtypes)
    }
}
