import Moya
import CombineMoya
import Combine
import Foundation
import SwiftUI

public class tachi_api {
    public static let instance = tachi_api()
    
    
    
    let provider:MoyaProvider<TachiService>
    public var server = Server.bokutachi
        
    private init() {
        let authplugin = AccessTokenPlugin(tokenClosure: { _ in Server.accessToken})
        provider = MoyaProvider<TachiService>(plugins: [authplugin])
    }
    
    public func getOAuthToken(clientId: String, clientSecret:String, redirectURI:String, code:String) -> AnyPublisher<OAuthTokenResponse,Error> {
        return provider.requestPublisher(.oauthToken(server: server, clientId: clientId, clientSecret: clientSecret, grantType: "authorization_code", redirectURI: redirectURI, code: code)).map{$0.data}.decode(type: WrappedOAuthTokenResponse.self, decoder: JSONDecoder()).map{$0.body}.eraseToAnyPublisher()
    }
    
    public func getMe() -> AnyPublisher<User,Error> {
        return provider.requestPublisher(.user(server: server, name: "me")).map({$0.data}).decode(type: UserResponse.self, decoder: JSONDecoder()).map({$0.user}).eraseToAnyPublisher()
    }
    
    public func getMyProfilePicture() -> AnyPublisher<Moya.ImageType, MoyaError> {
        return provider.requestPublisher(.profilePicture(server: server, name: "me")).map{$0.data}.map{return Moya.Image(data: $0) ?? Moya.Image()}.eraseToAnyPublisher()
    }
    
    public func getMyBanner() -> AnyPublisher<Moya.ImageType, MoyaError> {
        return provider.requestPublisher(.banner(server: server, name: "me")).map{$0.data}.map{return Moya.Image(data: $0) ?? Moya.Image()}.eraseToAnyPublisher()
    }
    
    public func getGameStatistics(for userID:Int) -> AnyPublisher<[GameStatistic], Error> {
        return provider.requestPublisher(.userStatisics(server: server, id: userID)).map({$0.data}).decode(type: UserStatisticsResponse.self, decoder: JSONDecoder()).map({$0.body}).eraseToAnyPublisher()
    }
    
    public func getGameStatistics(for username:String) -> AnyPublisher<[GameStatistic], Error> {
        return provider.requestPublisher(.userStatisics(server:server, name:username)).map({$0.data}).decode(type: UserStatisticsResponse.self, decoder: JSONDecoder()).map({$0.body}).eraseToAnyPublisher()
    }
    
    public func getGameStatisticsForMe() -> AnyPublisher<[GameStatistic], Error> {
        return getGameStatistics(for: "me")
    }
}
