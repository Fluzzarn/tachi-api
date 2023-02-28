public class KamaitachiClient: TachiClient {
    var hostName: String = "kamaitachi.xyz"
    lazy var client: HTTPClient<TachiEndpoints>? = {
        HTTPClient(client: self)
    }()
    
    public init() {
        
    }
    
    public func getUser(with id:Int) async -> User? {
        let response: StandardResponse<User>? =  await client?.perform(for: .user(id: id))
        return response?.body
    }
    
    public func getUser(with userName: String) async -> User? {
        let response: StandardResponse<User>? =  await client?.perform(for: .user(name: userName))
        return response?.body
    }
    
    public func getMe() async -> User? {
        let response: StandardResponse<User>? =  await client?.perform(for: .user())
        return response?.body
    }
    
    public func getGames() async -> Games? {
        let response: StandardResponse<Games>? =  await client?.perform(for: .games)
        return response?.body
    }
    
    public func getGame(name: String) async -> Game? {
        let response: StandardResponse<Game>? =  await client?.perform(for: .game(name: name))
        return response?.body
    }
    
    public func getGamePTConfig(name: String, playtype: String) async -> GamePTConfig? {
        let response: StandardResponse<GamePTConfig>? =  await client?.perform(for: .gamePTConfig(game: name, playtype: playtype))
        return response?.body
    }
    
    public func getTables(for game: String, playtype: String) async -> [Table]? {
        let response: StandardResponse<[Table]>? = await client?.perform(for: .allTables(game: game, playtype: playtype))
        return response?.body
    }
    
    public func getFolder(for game: String, playtype: String, with id: String) async -> Folder? {
        let response: StandardResponse<Folder>? = await client?.perform(for: .folder(game: game, playtype: playtype, id: id))
        return response?.body
    }
    
}
