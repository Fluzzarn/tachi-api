// UserGameProfileResponse.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userGameProfileResponse = try? newJSONDecoder().decode(UserGameProfileResponse.self, from: jsonData)

import Foundation

// MARK: - UserGameProfileResponse
public struct UserGameProfileResponse: Codable {
    public let success: Bool
    public let userGameProfileResponseDescription: String
    public let body: Body

    enum CodingKeys: String, CodingKey {
        case success
        case userGameProfileResponseDescription = "description"
        case body
    }

    public init(success: Bool, userGameProfileResponseDescription: String, body: Body) {
        self.success = success
        self.userGameProfileResponseDescription = userGameProfileResponseDescription
        self.body = body
    }
}

// Body.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let body = try? newJSONDecoder().decode(Body.self, from: jsonData)

import Foundation

// MARK: - Body
public struct Body: Codable {
    public let gameStats: GameStats
    public let firstScore: FirstScore
    public let mostRecentScore: MostRecentScore
    public let totalScores: Int
    public let rankingData: RankingData

    public init(gameStats: GameStats, firstScore: FirstScore, mostRecentScore: MostRecentScore, totalScores: Int, rankingData: RankingData) {
        self.gameStats = gameStats
        self.firstScore = firstScore
        self.mostRecentScore = mostRecentScore
        self.totalScores = totalScores
        self.rankingData = rankingData
    }
}

// FirstScore.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let firstScore = try? newJSONDecoder().decode(FirstScore.self, from: jsonData)

import Foundation

// MARK: - FirstScore
public struct FirstScore: Codable {
    public let userID, songID: Int
    public let playtype, chartID, game: String
    public let timeAdded, timeAchieved: Int
    public let comment: String?
    public let highlight: Bool
    public let service: String
    public let importType: ImportType?
    public let calculatedData: CalculatedData
    public let isPrimary: Bool
    public let scoreData: ScoreData
    public let scoreMeta: FirstScoreScoreMeta
    public let scoreID: String

    public init(userID: Int, songID: Int, playtype: String, chartID: String, game: String, timeAdded: Int, timeAchieved: Int, comment: String?, highlight: Bool, service: String, importType: ImportType?, calculatedData: CalculatedData, isPrimary: Bool, scoreData: ScoreData, scoreMeta: FirstScoreScoreMeta, scoreID: String) {
        self.userID = userID
        self.songID = songID
        self.playtype = playtype
        self.chartID = chartID
        self.game = game
        self.timeAdded = timeAdded
        self.timeAchieved = timeAchieved
        self.comment = comment
        self.highlight = highlight
        self.service = service
        self.importType = importType
        self.calculatedData = calculatedData
        self.isPrimary = isPrimary
        self.scoreData = scoreData
        self.scoreMeta = scoreMeta
        self.scoreID = scoreID
    }
}

// CalculatedData.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let calculatedData = try? newJSONDecoder().decode(CalculatedData.self, from: jsonData)

import Foundation

// MARK: - CalculatedData
public struct CalculatedData: Codable {
    public let sieglinde: Double

    public init(sieglinde: Double) {
        self.sieglinde = sieglinde
    }
}

// ScoreData.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scoreData = try? newJSONDecoder().decode(ScoreData.self, from: jsonData)

import Foundation

// MARK: - ScoreData
public struct ScoreData: Codable {
    public let esd: Double?
    public let grade: String
    public let gradeIndex: Int
    public let lamp: String
    public let lampIndex: Int
    public let percent: Double
    public let score: Int
    public let judgements: Judgements
    public let hitMeta: [String: Int?]

    public init(esd: Double?, grade: String, gradeIndex: Int, lamp: String, lampIndex: Int, percent: Double, score: Int, judgements: Judgements, hitMeta: [String: Int?]) {
        self.esd = esd
        self.grade = grade
        self.gradeIndex = gradeIndex
        self.lamp = lamp
        self.lampIndex = lampIndex
        self.percent = percent
        self.score = score
        self.judgements = judgements
        self.hitMeta = hitMeta
    }
}

// Judgements.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let judgements = try? newJSONDecoder().decode(Judgements.self, from: jsonData)

import Foundation

// MARK: - Judgements
public struct Judgements: Codable {
    public let pgreat, great, good, bad: Int
    public let poor: Int

    public init(pgreat: Int, great: Int, good: Int, bad: Int, poor: Int) {
        self.pgreat = pgreat
        self.great = great
        self.good = good
        self.bad = bad
        self.poor = poor
    }
}

// FirstScoreScoreMeta.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let firstScoreScoreMeta = try? newJSONDecoder().decode(FirstScoreScoreMeta.self, from: jsonData)

import Foundation

// MARK: - FirstScoreScoreMeta
public struct FirstScoreScoreMeta: Codable {
    public let random, inputDevice: JSONNull?

    public init(random: JSONNull?, inputDevice: JSONNull?) {
        self.random = random
        self.inputDevice = inputDevice
    }
}

// GameStats.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameStats = try? newJSONDecoder().decode(GameStats.self, from: jsonData)

import Foundation

// MARK: - GameStats
public struct GameStats: Codable {
    public let game, playtype: String
    public let userID: Int
    public let ratings: CalculatedData
    public let classes: Classes

    public init(game: String, playtype: String, userID: Int, ratings: CalculatedData, classes: Classes) {
        self.game = game
        self.playtype = playtype
        self.userID = userID
        self.ratings = ratings
        self.classes = classes
    }
}

// MostRecentScore.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mostRecentScore = try? newJSONDecoder().decode(MostRecentScore.self, from: jsonData)

import Foundation

// MARK: - MostRecentScore
public struct MostRecentScore: Codable {
    public let comment: JSONNull?
    public let game, importType: String
    public let scoreMeta: MostRecentScoreScoreMeta
    public let timeAchieved: Int
    public let service: String
    public let scoreData: ScoreData
    public let highlight: Bool
    public let timeAdded, userID: Int
    public let calculatedData: CalculatedData
    public let songID: Int
    public let chartID, scoreID, playtype: String
    public let isPrimary: Bool

    public init(comment: JSONNull?, game: String, importType: String, scoreMeta: MostRecentScoreScoreMeta, timeAchieved: Int, service: String, scoreData: ScoreData, highlight: Bool, timeAdded: Int, userID: Int, calculatedData: CalculatedData, songID: Int, chartID: String, scoreID: String, playtype: String, isPrimary: Bool) {
        self.comment = comment
        self.game = game
        self.importType = importType
        self.scoreMeta = scoreMeta
        self.timeAchieved = timeAchieved
        self.service = service
        self.scoreData = scoreData
        self.highlight = highlight
        self.timeAdded = timeAdded
        self.userID = userID
        self.calculatedData = calculatedData
        self.songID = songID
        self.chartID = chartID
        self.scoreID = scoreID
        self.playtype = playtype
        self.isPrimary = isPrimary
    }
}

// MostRecentScoreScoreMeta.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mostRecentScoreScoreMeta = try? newJSONDecoder().decode(MostRecentScoreScoreMeta.self, from: jsonData)

import Foundation

// MARK: - MostRecentScoreScoreMeta
public struct MostRecentScoreScoreMeta: Codable {
    public let client, inputDevice, random: String

    public init(client: String, inputDevice: String, random: String) {
        self.client = client
        self.inputDevice = inputDevice
        self.random = random
    }
}
