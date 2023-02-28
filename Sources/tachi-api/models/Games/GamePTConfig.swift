// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gamePTConfig = try? JSONDecoder().decode(GamePTConfig.self, from: jsonData)

import Foundation

// MARK: - GamePTConfig
struct GamePTConfig: Codable {
    let config: Config
    let scoreCount, playerCount, chartCount: Int
}

// MARK: - Config
struct Config: Codable {
    let providedMetrics: ProvidedMetrics
    let derivedMetrics: DerivedMetrics
    let defaultMetric, preferredDefaultEnum: String
    let optionalMetrics: [String: Percent]
    let defaultScoreRatingAlg, defaultSessionRatingAlg, defaultProfileRatingAlg: String
    let scoreRatingAlgs, profileRatingAlgs, sessionRatingAlgs: [String: RatingAlgs]
    let difficulties: Difficulties
    let classes: Classes
    let orderedJudgements: [String]
    let versions: [String:String]
    let supportedMatchTypes: [String]
}

// MARK: - Classes
struct Classes: Codable {
    let dan: Dan
}

// MARK: - Dan
struct Dan: Codable {
    let type: String
    let values: [DanDescription]
}

// MARK: - Value
struct DanDescription: Codable {
    let id, display, hoverText: String
}

// MARK: - DerivedMetrics
struct DerivedMetrics: Codable {
    let percent: Percent
    let grade: Grade
}

// MARK: - Grade
struct Grade: Codable {
    let type: String
    let values: [String]
    let minimumRelevantValue, description: String
}

// MARK: - Percent
struct Percent: Codable {
    let type: String
    let description: String
}


// MARK: - Difficulties
struct Difficulties: Codable {
    let type: String
    let order: [String]
    let shorthand: [String: String]
    let difficultiesDefault: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case order
        case shorthand
        case difficultiesDefault = "default"
    }
}


// MARK: - Bpi
struct RatingAlgs: Codable {
    let description: String
}

// MARK: - ProvidedMetrics
struct ProvidedMetrics: Codable {
    let score: Score
    let lamp: Grade
}

// MARK: - Score
struct Score: Codable {
    let type: String
    let chartDependentMax: Bool
    let description: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.chartDependentMax = try container.decode(Bool.self, forKey: .chartDependentMax)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
