// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bpi = try? newJSONDecoder().decode(Bpi.self, from: jsonData)

import Foundation

// MARK: - Bpi

public struct GameStatisticRanking: Codable {
    public let ranking, outOf: Int

    public init(ranking: Int, outOf: Int) {
        self.ranking = ranking
        self.outOf = outOf
    }
}
