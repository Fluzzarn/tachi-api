//
//  File.swift
//
//
//  Created by Dan Mclean on 12/13/21.
//

import Foundation
import Moya

enum TachiService {
    typealias serverInfo = (server: Server, id: Int?, name: String?)

    func constructUserURL(base: String, id: Int? = nil, username: String? = nil) -> String {
        if let id = id {
            return base.replacingOccurrences(of: "|", with: "\(id)")
        } else if let name = username {
            return base.replacingOccurrences(of: "|", with: name)
        } else {
            return base.replacingOccurrences(of: "|", with: "me")
        }
    }

    func serverURL(server: Server) -> URL {
        switch server {
        case .bokutachi:
            return URL(string: "https://bokutachi.xyz/api/v1")!
        case .kamaitachi:
            return URL(string: "https://kamaitachi.xyz/api/v1")!
        }
    }

    case users(server: Server, search: String? = nil)
    case user(server: Server, id: Int? = nil, name: String? = nil)
    case userStatisics(server: Server, id: Int? = nil, name: String? = nil)
    case profilePicture(server: Server, id: Int? = nil, name: String? = nil)
    case banner(server: Server, id: Int? = nil, name: String? = nil)
    case oauthToken(server: Server, clientId:String, clientSecret:String, grantType:String, redirectURI:String, code: String)
}

extension TachiService: TargetType, AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        switch self {
        case .oauthToken:
            return .none
        default:
            return .bearer
        }

    }
    
    var baseURL: URL {
        switch self {
        case let .users(server, _),
             let .user(server, _, _),
             let .userStatisics(server: server, _, _),
             let .profilePicture(server: server, _, _),
             let .banner(server: server, _, _),
            let .oauthToken(server: server, _,_,_,_,_):
            return serverURL(server: server)
    }
    }

    var path: String {
        switch self {
        case .users:
            return "/users"
        case let .user(_, id: id, name: name):
            return constructUserURL(base: "/users/|", id: id, username: name)
        case let .userStatisics(_, id: id, name: name):
            return constructUserURL(base: "/users/|/game-stats", id: id, username: name)
        case let .profilePicture(_, id: id, name: name):
            return constructUserURL(base: "/users/|/pfp", id: id, username: name)
        case let .banner(_, id: id, name: name):
            return constructUserURL(base: "/users/|/banner", id: id, username: name)
        case .oauthToken(server: let server, _,_,_,_,_):
            return "/oauth/token"
        }
    }

    var method: Moya.Method {
        switch self {
        case .users(_, _),
             .user(_, _, _),
             .userStatisics(_, _, _),
             .profilePicture(_, _, _),
             .banner:
            return .get
        case .oauthToken(_,_,_,_,_,_):
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .users(_, search):
            if let search = search {
                return .requestParameters(parameters: ["search": search], encoding: JSONEncoding.default)
            } else {
                return .requestPlain
            }
        case let .oauthToken(_,clientId,clientSecret,grantType,redirectURI, code):
            let request = OAuthTokenRequest(clientID: clientId, clientSecret: clientSecret, grantType: grantType, redirectURI: redirectURI, code: code)
            return .requestJSONEncodable(request)
        
        case .user, .userStatisics, .profilePicture, .banner:
            return .requestPlain
        }
    }

    var sampleData: Data {
        switch self {
        case .users:
            guard let url = Bundle.module.url(forResource: "users_test", withExtension: "json"), let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data
        case .user:
            let fileName = "user_name"
            guard let url = Bundle.module.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data
        case .userStatisics:
            let fileName = "user_stats_name"
            guard let url = Bundle.module.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data
        case .profilePicture:
            let fileName = "test_pfp"
            guard let url = Bundle.module.url(forResource: fileName, withExtension: "png"), let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data
        case .banner:
            let fileName = "test_banner"
            guard let url = Bundle.module.url(forResource: fileName, withExtension: "png"), let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data
        case .oauthToken(server: let server, clientId: let clientId, clientSecret: let clientSecret, grantType: let grantType, redirectURI: let redirectURI, code: let code):
            return Data()
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    }

// MARK: - Helpers

private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(utf8) }
}
