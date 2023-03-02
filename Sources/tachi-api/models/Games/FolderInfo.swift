//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/27/23.
//

import Foundation


public struct FolderInfo: Codable, Hashable {
    public let folderID: String
    public let game: String
    public let inactive: Bool
    public let playtype: String
    public let searchTerms: [String]
    public let title: String
    public let type: String
    public let data: FolderData
    
    enum CodingKeys: CodingKey {
        case folderID
        case game
        case inactive
        case playtype
        case searchTerms
        case title
        case type
        case data
    }
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<FolderInfo.CodingKeys> = try decoder.container(keyedBy: FolderInfo.CodingKeys.self)
        
        self.folderID = try container.decode(String.self, forKey: FolderInfo.CodingKeys.folderID)
        self.game = try container.decode(String.self, forKey: FolderInfo.CodingKeys.game)
        self.inactive = try container.decode(Bool.self, forKey: FolderInfo.CodingKeys.inactive)
        self.playtype = try container.decode(String.self, forKey: FolderInfo.CodingKeys.playtype)
        self.searchTerms = try container.decode([String].self, forKey: FolderInfo.CodingKeys.searchTerms)
        self.title = try container.decode(String.self, forKey: FolderInfo.CodingKeys.title)
        self.type = try container.decode(String.self, forKey: FolderInfo.CodingKeys.type)
        self.data = try container.decode(FolderData.self, forKey: FolderInfo.CodingKeys.data)
        
    }

}


public struct FolderData: Codable, Hashable {
    public let level: String?
    public let versions: String
    public let levelNum: [String:Int]?
    
    enum CodingKeys: CodingKey {
        case level
        case levelNum
        case versions
    }
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<FolderData.CodingKeys> = try decoder.container(keyedBy: FolderData.CodingKeys.self)
        let nullableLevel = try? container.decodeIfPresent(String.self, forKey: FolderData.CodingKeys.level)
        if nullableLevel == nil {
            if let nullableDict = try container.decodeIfPresent([String:[String]].self, forKey: FolderData.CodingKeys.level) {
                self.level = nullableDict["~in"]?.joined(separator: "-") ?? ""
            } else {
                self.level = nil
            }
        } else {
            self.level = try container.decodeIfPresent(String.self, forKey: FolderData.CodingKeys.level)
        }
        
        self.versions = try container.decode(String.self, forKey: FolderData.CodingKeys.versions)
        self.levelNum = try container.decodeIfPresent([String:Int].self, forKey: FolderData.CodingKeys.levelNum)
    }
}
