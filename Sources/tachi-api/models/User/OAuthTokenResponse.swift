// OAuthTokenResponse.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let oAuthTokenResponse = try? newJSONDecoder().decode(OAuthTokenResponse.self, from: jsonData)

import Foundation

// MARK: - OAuthTokenResponse
public struct OAuthTokenResponse: Codable {
    public let userID: Int
    public let token, identifier: String
    public let permissions: Permissions
    public let fromOAuth2Client: String

    public init(userID: Int, token: String, identifier: String, permissions: Permissions, fromOAuth2Client: String) {
        self.userID = userID
        self.token = token
        self.identifier = identifier
        self.permissions = permissions
        self.fromOAuth2Client = fromOAuth2Client
    }
}

// Permissions.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let permissions = try? newJSONDecoder().decode(Permissions.self, from: jsonData)

import Foundation

// MARK: - Permissions
public struct Permissions: Codable {
    public let customiseProfile: Bool

    enum CodingKeys: String, CodingKey {
        case customiseProfile = "customise_profile"
    }

    public init(customiseProfile: Bool) {
        self.customiseProfile = customiseProfile
    }
}

// JSONSchemaSupport.swift

import Foundation
