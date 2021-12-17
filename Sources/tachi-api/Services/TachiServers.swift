//
//  File.swift
//  
//
//  Created by Dan Mclean on 12/14/21.
//

import Foundation

internal enum Server {
    case bokutachi
    case kamaitachi
    
    var baseURL: URL {
        switch self {
        case .bokutachi:
            return URL(string: "https://bokutachi.xyz")!
        case .kamaitachi:
            return URL(string: "https://kamaitachi.xyz")!
        }
    }
}
