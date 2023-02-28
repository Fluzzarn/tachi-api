//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/27/23.
//

import Foundation

public struct Folder: Codable {
     public let songs: [Song]
     public let charts: [Chart]
     public let folder: FolderInfo
    
    enum CodingKeys: CodingKey {
        case songs
        case charts
        case folder
    }
    
   public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Folder.CodingKeys> = try decoder.container(keyedBy: Folder.CodingKeys.self)
        
        self.songs = try container.decode([Song].self, forKey: Folder.CodingKeys.songs)
        self.charts = try container.decode([Chart].self, forKey: Folder.CodingKeys.charts)
        self.folder = try container.decode(FolderInfo.self, forKey: Folder.CodingKeys.folder)
        
    }

}
