// zkldi I hate you for having dynamic json keys

import Foundation

// MARK: - RankingData

public struct RankingData: Codable, Hashable{
    public var ranking: GameStatisticRanking?

    enum CodingKeys:CodingKey {
        
    }

    public init(ranking: GameStatisticRanking?) {
        self.ranking = ranking
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: DynamicCodingKeys.self)
        for key in values.allKeys {
            self.ranking = try values.decode(GameStatisticRanking?.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
        }
    }
}

// Define DynamicCodingKeys type needed for creating
    // decoding container from JSONDecoder
    private struct DynamicCodingKeys: CodingKey {

        // Use for string-keyed dictionary
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        // Use for integer-keyed dictionary
        var intValue: Int?
        init?(intValue: Int) {
            // We are not using this, thus just return nil
            return nil
        }
    }
