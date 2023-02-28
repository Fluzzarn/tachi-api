//
//  File.swift
//  
//
//  Created by Dan Mclean on 2/22/23.
//

import Foundation
@available(macOS 12.0.0, *)
class HTTPClient<T: Endpoint> {
    var client: TachiClient
    
    init(client: TachiClient) {
        self.client = client
    }
    
    
    func perform<R: Codable>(for endpoint: T) async -> R? {
        
        var request = URLRequest(url: makeURL(for: endpoint))
        request.httpMethod = endpoint.method.rawValue
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            let deseralizer = JSONDecoder()
            return  try deseralizer.decode(R.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
    
    
    func makeURL(for endpoint: Endpoint) -> URL {
        let baseURL = client.hostName
        let fullURL = "https://\(baseURL)/api/v\(endpoint.version)\(endpoint.path)"
        guard let url = URL(string: fullURL) else {
            return URL(string: "")!
        }
        return url
    }
    
}
