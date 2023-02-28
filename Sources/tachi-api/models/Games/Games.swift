//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/23/23.
//

import Foundation



public struct Games: Codable {
    var supportedGames: [String]
    var configs: [String:Game]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.supportedGames = try container.decode([String].self, forKey: .supportedGames)
        self.configs = try container.decode([String: Game].self, forKey: .configs)
    }
    
}
