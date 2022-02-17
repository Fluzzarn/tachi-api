//
//  File.swift
//
//
//  Created by Dan Mclean on 12/14/21.
//

import Foundation

public enum Server {
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
    public static var accessToken:String = ""
}
