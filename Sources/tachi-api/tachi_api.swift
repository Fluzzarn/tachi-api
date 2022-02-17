import Moya
import CombineMoya
import Combine
import Foundation

public class tachi_api {
    public static let instance = tachi_api()
    
    
    
    let provider:MoyaProvider<TachiService>
    public var server = Server.bokutachi
        
    private init() {
        let authplugin = AccessTokenPlugin(tokenClosure: { _ in Server.accessToken})
        provider = MoyaProvider<TachiService>(plugins: [authplugin])
    }
    
    public func getOAuthToken(clientId: String, clientSecret:String, redirectURI:String, code:String) -> AnyPublisher<OAuthTokenResponse,Error> {
        return provider.requestPublisher(.oauthToken(server: server, clientId: clientId, clientSecret: clientSecret, grantType: "authorization_code", redirectURI: redirectURI, code: code)).map{$0.data}.decode(type: OAuthTokenResponse.self, decoder: JSONDecoder()).eraseToAnyPublisher()
    }
    
    public func getMe() -> AnyPublisher<User,Error> {
        return provider.requestPublisher(.user(server: server, name: "me")).map({$0.data}).decode(type: UserResponse.self, decoder: JSONDecoder()).map({$0.user}).eraseToAnyPublisher()
    }
}
