//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/27/23.
//

import Foundation


public struct Song: Codable, Hashable {
    
   public let id: Int
   public let title: String
   public let artist: String
   public let searchTerms: [String]
   public let altTitles: [String]
   public let data: SongData
    
}


public struct SongData:Codable, Hashable {
   public let genre: String?
   public let displayVersion: String?
   public let titleJP: String?
   public let artistJP: String?
   public let subtitle: String?
   public let subartist: String?
   public let tableString: String?
   public let isHot: Bool?
   public let genreEN: String?
}
