// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rankingData = try? newJSONDecoder().decode(RankingData.self, from: jsonData)

import Foundation

// MARK: - RankingData
public struct RankingData: Codable {
    public let ktRating, ktLampRating, bpi, vf6: GameStatisticRanking?

    enum CodingKeys: String, CodingKey {
        case ktRating, ktLampRating
        case bpi = "BPI"
        case vf6 = "VF6"
    }

    public init(ktRating: GameStatisticRanking?, ktLampRating: GameStatisticRanking?, bpi: GameStatisticRanking?, vf6: GameStatisticRanking?) {
        self.ktRating = ktRating
        self.ktLampRating = ktLampRating
        self.bpi = bpi
        self.vf6 = vf6
    }
}
