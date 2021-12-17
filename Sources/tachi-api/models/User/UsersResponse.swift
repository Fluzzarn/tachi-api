// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty

public struct UsersResponse: Codable {
    public let success: Bool
    public let purpleDescription: String
    public let users: [User]

    enum CodingKeys: String, CodingKey {
        case success
        case purpleDescription = "description"
        case users = "body"
    }

    public init(success: Bool, purpleDescription: String, users: [User]) {
        self.success = success
        self.purpleDescription = purpleDescription
        self.users = users
    }
}
