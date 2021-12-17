// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let body = try? newJSONDecoder().decode(Body.self, from: jsonData)

import Foundation

// MARK: - Body

public struct GameStatistic: Codable {
    public let game, playtype: String
    public let userID: Int
    public let ratings: Ratings
    public let classes: Classes
    public let rankingData: RankingData

    enum CodingKeys: String, CodingKey {
        case game, playtype, userID, ratings, classes
        case rankingData = "__rankingData"
    }

    public init(game: String, playtype: String, userID: Int, ratings: Ratings, classes: Classes, rankingData: RankingData) {
        self.game = game
        self.playtype = playtype
        self.userID = userID
        self.ratings = ratings
        self.classes = classes
        self.rankingData = rankingData
    }
}
