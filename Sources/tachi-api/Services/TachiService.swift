//
//  File.swift
//  
//
//  Created by Dan Mclean on 12/13/21.
//

import Foundation
import Moya

enum TachiService {
    case users(search: String? = nil)
    case user(id: Int? = nil, name: String? = nil)
}

extension TachiService: TargetType {
    var baseURL: URL {
        URL(string: "https://kamaitachi.xyz/api/v1")!
    }
    
    var path: String {
        switch self {
        case .users:
            return "/users"
        case .user(id: let id, name: let name):
            if let id = id {
                return "/users/\(id)"
            } else if let name = name {
                return "/users/\(name)"
            } else {
                return "/users/me"
            }
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .users:
            return .get
        case .user(_,_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .users(let search):
            if let search = search {
                return .requestParameters(parameters: ["search": search], encoding: JSONEncoding.default)
            } else  {
                return .requestPlain
            }
        case .user(_,_):
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .users(_):
            guard let url = Bundle.module.url(forResource: "users_test", withExtension: "json"), let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data 
        case .user(id: let id, name: let name):
            var fileName = "user_me"
            if id != nil {
                fileName = "user_id"
            } else if name != nil {
                fileName = "user_name"
            }
            guard let url = Bundle.module.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data
        }
        
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
