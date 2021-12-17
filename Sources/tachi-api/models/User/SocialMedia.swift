// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let socialMedia = try? newJSONDecoder().decode(SocialMedia.self, from: jsonData)

import Foundation

// MARK: - SocialMedia

public struct SocialMedia: Codable {
    public let discord: String?
    public let twitter, youtube, twitch: String?
    public let github: String?
    public let steam: String?

    public init(discord: String, twitter: String?, youtube: String?, twitch: String?, github: String, steam: String?) {
        self.discord = discord
        self.twitter = twitter
        self.youtube = youtube
        self.twitch = twitch
        self.github = github
        self.steam = steam
    }
}
