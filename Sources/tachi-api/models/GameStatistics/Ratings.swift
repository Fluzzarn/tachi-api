// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ratings = try? newJSONDecoder().decode(Ratings.self, from: jsonData)

import Foundation

// MARK: - Ratings

public struct Ratings: Codable {
    public let bpi, ktRating, ktLampRating, vf6: Double?

    enum CodingKeys: String, CodingKey {
        case bpi = "BPI"
        case ktRating, ktLampRating
        case vf6 = "VF6"
    }

    public init(bpi: Double?, ktRating: Double?, ktLampRating: Double?, vf6: Double?) {
        self.bpi = bpi
        self.ktRating = ktRating
        self.ktLampRating = ktLampRating
        self.vf6 = vf6
    }
}
