//
//  File.swift
//  
//
//  Created by Dan Mclean on 3/21/23.
//

import Foundation


struct OAuthToken: Codable {
    var code: String
    var userID: Int
    var createdOn: Date
}
