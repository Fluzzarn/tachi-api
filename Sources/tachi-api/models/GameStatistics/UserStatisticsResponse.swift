// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userStatisticsResponse = try? newJSONDecoder().decode(UserStatisticsResponse.self, from: jsonData)

import Foundation

// MARK: - UserStatisticsResponse
public struct UserStatisticsResponse: Codable {
    public let success: Bool
    public let userStatisticsResponseDescription: String
    public let body: [GameStatistic]

    enum CodingKeys: String, CodingKey {
        case success
        case userStatisticsResponseDescription = "description"
        case body
    }

    public init(success: Bool, userStatisticsResponseDescription: String, body: [GameStatistic]) {
        self.success = success
        self.userStatisticsResponseDescription = userStatisticsResponseDescription
        self.body = body
    }
}
