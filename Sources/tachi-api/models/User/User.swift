// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)

import Foundation

// MARK: - User
public struct User: Codable {
    public let username, usernameLowercase, about: String
    public let clan: String?
    public let customBannerLocation, customPfpLocation: String?
    public let id, lastSeen: Int
    public let socialMedia: SocialMedia
    public let joinDate, authLevel: Int
    public let status: String?
    public let badges: [String]

    public init(username: String, usernameLowercase: String, about: String, clan: String, customBannerLocation: String, customPfpLocation: String, id: Int, lastSeen: Int, socialMedia: SocialMedia, joinDate: Int, authLevel: Int, status: String?, badges: [String]) {
        self.username = username
        self.usernameLowercase = usernameLowercase
        self.about = about
        self.clan = clan
        self.customBannerLocation = customBannerLocation
        self.customPfpLocation = customPfpLocation
        self.id = id
        self.lastSeen = lastSeen
        self.socialMedia = socialMedia
        self.joinDate = joinDate
        self.authLevel = authLevel
        self.status = status
        self.badges = badges
    }
}
