//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/27/23.
//

import Foundation


public struct Chart: Codable {
    let chartID: String?
    let songID: Int?
    let level: String?
    let levelNum: Float?
    let isPrimary: Bool?
    let difficulty: String?
    let playtype: String?
    let data: ChartData?
    let versions: [String]?
}

public struct ChartData: Codable {
    let notecount: Int?
    var inGameID: [Int]?
    let hashSHA256: String?
    let iidxtraSet: String?
    let kaidenAverage: Int?
    let worldRecord: Int?
    let bpiCoefficient: Float?
    let ncTier: TierListData?
    let hcTier: TierListData?
    let exhcTier: TierListData?
    let hashMD5: String?
    let sglEC: Float?
    let sglHC: Float?
    let aiLevel: String?
    let tableFolders: [TableData]?
    let isLatest: Bool?
    let clearTier: TierListData?
    let hashSHA1: String?
    let isOfficial: Bool?
    let effector: String?
    let rankedLevel: Bool?
    let chartLevel: Float?
    let hashGSv3: String?
    let difficultyTag: String?
    let length: Float?
    let charter: String?
    let streamBPM: Float?
    let npsPerMeasure: [Float]?
    let notesPerMeasure: [Float]?
    let bannerLocationOverride: String?
    let originalPack: String?
    let packs: [String]?
    let breakdown: Breakdown?
    
    enum CodingKeys: String, CodingKey {
        case notecount
        case inGameID
        case hashSHA256
        case iidxtraSet = "2dxtraSet"
        case kaidenAverage
        case worldRecord
        case bpiCoefficient
        case ncTier
        case hcTier
        case exhcTier
        case hashMD5
        case sglEC
        case sglHC
        case aiLevel
        case tableFolders
        case isLatest
        case clearTier
        case hashSHA1
        case isOfficial
        case effector
        case rankedLevel
        case chartLevel
        case hashGSv3
        case difficultyTag
        case length
        case charter
        case streamBPM
        case npsPerMeasure
        case notesPerMeasure
        case bannerLocationOverride
        case originalPack
        case packs
        case breakdown
    }
    
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ChartData.CodingKeys> = try decoder.container(keyedBy: ChartData.CodingKeys.self)
        
        self.notecount = try container.decodeIfPresent(Int.self, forKey: ChartData.CodingKeys.notecount)
        self.inGameID = try? container.decodeIfPresent([Int].self, forKey: ChartData.CodingKeys.inGameID)
        if (self.inGameID == nil) {
            let id = try container.decodeIfPresent(Int.self, forKey: ChartData.CodingKeys.inGameID)
            if (id == nil) {
                self.inGameID = [id ?? 0]
            }
                
        }

        self.hashSHA256 = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.hashSHA256)
        self.iidxtraSet = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.iidxtraSet)
        self.kaidenAverage = try container.decodeIfPresent(Int.self, forKey: ChartData.CodingKeys.kaidenAverage)
        self.worldRecord = try container.decodeIfPresent(Int.self, forKey: ChartData.CodingKeys.worldRecord)
        self.bpiCoefficient = try container.decodeIfPresent(Float.self, forKey: ChartData.CodingKeys.bpiCoefficient)
        self.ncTier = try container.decodeIfPresent(TierListData.self, forKey: ChartData.CodingKeys.ncTier)
        self.hcTier = try container.decodeIfPresent(TierListData.self, forKey: ChartData.CodingKeys.hcTier)
        self.exhcTier = try container.decodeIfPresent(TierListData.self, forKey: ChartData.CodingKeys.exhcTier)
        self.hashMD5 = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.hashMD5)
        self.sglEC = try container.decodeIfPresent(Float.self, forKey: ChartData.CodingKeys.sglEC)
        self.sglHC = try container.decodeIfPresent(Float.self, forKey: ChartData.CodingKeys.sglHC)
        self.aiLevel = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.aiLevel)
        self.tableFolders = try container.decodeIfPresent([TableData].self, forKey: ChartData.CodingKeys.tableFolders)
        self.isLatest = try container.decodeIfPresent(Bool.self, forKey: ChartData.CodingKeys.isLatest)
        self.clearTier = try container.decodeIfPresent(TierListData.self, forKey: ChartData.CodingKeys.clearTier)
        self.hashSHA1 = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.hashSHA1)
        self.isOfficial = try container.decodeIfPresent(Bool.self, forKey: ChartData.CodingKeys.isOfficial)
        self.effector = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.effector)
        self.rankedLevel = try container.decodeIfPresent(Bool.self, forKey: ChartData.CodingKeys.rankedLevel)
        self.chartLevel = try container.decodeIfPresent(Float.self, forKey: ChartData.CodingKeys.chartLevel)
        self.hashGSv3 = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.hashGSv3)
        self.difficultyTag = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.difficultyTag)
        self.length = try container.decodeIfPresent(Float.self, forKey: ChartData.CodingKeys.length)
        self.charter = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.charter)
        self.streamBPM = try container.decodeIfPresent(Float.self, forKey: ChartData.CodingKeys.streamBPM)
        self.npsPerMeasure = try container.decodeIfPresent([Float].self, forKey: ChartData.CodingKeys.npsPerMeasure)
        self.notesPerMeasure = try container.decodeIfPresent([Float].self, forKey: ChartData.CodingKeys.notesPerMeasure)
        self.bannerLocationOverride = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.bannerLocationOverride)
        self.originalPack = try container.decodeIfPresent(String.self, forKey: ChartData.CodingKeys.originalPack)
        self.packs = try container.decodeIfPresent([String].self, forKey: ChartData.CodingKeys.packs)
        self.breakdown = try container.decodeIfPresent(Breakdown.self, forKey: ChartData.CodingKeys.breakdown)
        
    }
}

public struct Breakdown: Codable {
    let detailed: String?
    let partiallySimplified: String?
    let simplified: String?
    let total: String?
    let density: Float?
}

public struct TableData: Codable {
    let table: String?
    let level: String?
}

public struct TierListData: Codable {
    let value: Float
    let text: String
    let individualDifference: Bool
}
