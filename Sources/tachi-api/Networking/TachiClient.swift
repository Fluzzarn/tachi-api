//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/22/23.
//

import Foundation


protocol TachiClient {
    var hostName: String {get}
    var clientId: String {get}
    var clientSecret: String {get}
    var redirectURL: String {get}
    
    var oauthCode: String? {get set}
}
