//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/22/23.
//

import Foundation


struct StandardResponse<T: Codable>: Codable {
    var success: Bool
    var description: String
    var body: T
}
