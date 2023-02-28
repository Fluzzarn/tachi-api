//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/22/23.
//

import Foundation


enum TachiEndpoints {
    case user(id: Int? = nil, name:String? = nil)
    case games
    case game(name: String)
    case gamePTConfig(game: String, playtype: String)
    case allTables(game: String, playtype: String)
    case folder(game: String, playtype: String, id: String)
}

extension TachiEndpoints: Endpoint {
    
    var version: Int {
        return 1
    }
    
    var path: String {
        switch self {
        case let .user(id, name):
            if let id = id {
                return "/users/\(id)"
            } else if let name = name {
                return "/users/\(name)"
            } else {
                return "/users/me"
            }
        case .games:
            return "/games"
        case let .game(name):
            return "/games/\(name)"
        case let .gamePTConfig(game, playtype):
            return "/games/\(game)/\(playtype)"
        case let .allTables(game, playtype):
            return "/games/\(game)/\(playtype)/tables"
        case let .folder(game, playtype, id):
            return "/games/\(game)/\(playtype)/folders/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .user,
            .games,
            .game,
            .gamePTConfig,
            .allTables,
            .folder:
            return .GET
        }
    }
    
    
}
