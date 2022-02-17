// UserStatisticsResponse.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userStatisticsResponse = try? newJSONDecoder().decode(UserStatisticsResponse.self, from: jsonData)

import Foundation

// MARK: - UserStatisticsResponse
public struct OAuthTokenRequest: Codable {
    public let clientID, clientSecret, grantType: String
    public let redirectURI: String
    public let code: String

    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case clientSecret = "client_secret"
        case grantType = "grant_type"
        case redirectURI = "redirect_uri"
        case code
    }

    public init(clientID: String, clientSecret: String, grantType: String, redirectURI: String, code: String) {
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.grantType = grantType
        self.redirectURI = redirectURI
        self.code = code
    }
}

// JSONSchemaSupport.swift

import Foundation
