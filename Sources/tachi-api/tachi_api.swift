import Moya
import CombineMoya
import Combine
import Foundation

class tachi_api {
    public static let instance = tachi_api()
    
    public var accessToken:String = ""
    let authplugin = AccessTokenPlugin(tokenClosure: {_ in tachi_api.instance.accessToken})
    let provider = MoyaProvider<TachiService>(plugins: [tachi_api.instance.authplugin])
    public var server = Server.bokutachi
        
    private init() {}
    
    public func getMe() -> AnyPublisher<User,Error> {
        return provider.requestPublisher(.user(server: server, name: "me")).map({$0.data}).decode(type: UserResponse.self, decoder: JSONDecoder()).map({$0.user}).eraseToAnyPublisher()
    }
}
