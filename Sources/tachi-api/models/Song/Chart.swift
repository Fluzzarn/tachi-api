//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/27/23.
//

import Foundation


public struct Chart: Codable, Hashable, Comparable {
    public static func < (lhs: Chart, rhs: Chart) -> Bool {
        return lhs.level ?? "" < rhs.level ?? ""
    }
    
    public let chartID: String?
    public let songID: Int?
    public let level: String?
    public let levelNum: Float?
    public let isPrimary: Bool?
    public let difficulty: String?
    public let playtype: String?
    public let data: ChartData?
    public let versions: [String]?
}

public struct ChartData: Codable, Hashable {
    public let notecount: Int?
    public var inGameID: [Int]?
    public let hashSHA256: String?
    public let iidxtraSet: String?
    public let kaidenAverage: Int?
    public let worldRecord: Int?
    public let bpiCoefficient: Float?
    public let ncTier: TierListData?
    public let hcTier: TierListData?
    public let exhcTier: TierListData?
    public let hashMD5: String?
    public let sglEC: Float?
    public let sglHC: Float?
    public let aiLevel: String?
    public let tableFolders: [TableData]?
    public let isLatest: Bool?
    public let clearTier: TierListData?
    public let hashSHA1: String?
    public let isOfficial: Bool?
    public let effector: String?
    public let rankedLevel: Bool?
    public let chartLevel: Float?
    public let hashGSv3: String?
    public let difficultyTag: String?
    public let length: Float?
    public let charter: String?
    public let streamBPM: Float?
    public let npsPerMeasure: [Float]?
    public let notesPerMeasure: [Float]?
    public let bannerLocationOverride: String?
    public let originalPack: String?
    public let packs: [String]?
    public let breakdown: Breakdown?
    public let dpTier: TierListData?
    
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
        case dpTier
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
        self.dpTier = try container.decodeIfPresent(TierListData.self, forKey: .dpTier)
    }
}

public struct Breakdown: Codable, Hashable {
    public let detailed: String?
    public let partiallySimplified: String?
    public let simplified: String?
    public let total: String?
    public let density: Float?
}

public struct TableData: Codable, Hashable {
    public let table: String?
    public let level: String?
}

public struct TierListData: Codable, Hashable {
    public let value: Float
    public let text: String
    public let individualDifference: Bool
}
