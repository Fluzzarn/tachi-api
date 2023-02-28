//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/27/23.
//

import Foundation


public struct Song: Codable {
    let id: Int
    let title: String
    let artist: String
    let searchTerms: [String]
    let altTitles: [String]
    let data: SongData
    
}


public struct SongData:Codable {
    let genre: String?
    let displayVersion: String?
    let titleJP: String?
    let artistJP: String?
    let subtitle: String?
    let subartist: String?
    let tableString: String?
    let isHot: Bool?
    let genreEN: String?
}
