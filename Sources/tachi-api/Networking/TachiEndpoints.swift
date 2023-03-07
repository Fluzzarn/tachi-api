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
    case table(game: String, playtype: String, id: String)
    case getProfilePicture(id: Int? = nil, name:String? = nil)
    case getProfileBanner(id: Int? = nil, name:String? = nil)
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
        case let .table(game, playtype, id):
            return "/games/\(game)/\(playtype)/tables/\(id)"
        case .getProfilePicture(id: let id, name: let name):
            if let id = id {
                return "/users/\(id)/pfp"
            } else if let name = name {
                return "/users/\(name)/pfp"
            } else {
                return "/users/me/pfp"
            }
        case .getProfileBanner(id: let id, name: let name):
            if let id = id {
                return "/users/\(id)/banner"
            } else if let name = name {
                return "/users/\(name)/banner"
            } else {
                return "/users/me/banner"
            }
        }
    }
    
    
    
    var method: HTTPMethod {
        switch self {
        case .user,
                .games,
                .game,
                .gamePTConfig,
                .allTables,
                .folder,
                .table,
                .getProfilePicture,
                .getProfileBanner:
            return .GET
        }
    }
    
}

