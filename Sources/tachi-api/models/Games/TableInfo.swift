//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/28/23.
//

import Foundation


public struct TableInfo: Codable, Hashable {
    public static func == (lhs: TableInfo, rhs: TableInfo) -> Bool {
        lhs.table.tableID == rhs.table.tableID
    }
    
    public var folders: [FolderInfo]
    public var table: Table
}
