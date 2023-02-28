//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/22/23.
//

import Foundation


protocol Endpoint {
    var path: String {get}
    var method: HTTPMethod {get}
    var version: Int {get}
}



enum HTTPMethod: String {
    case GET
    case POST
    case PUT
}
