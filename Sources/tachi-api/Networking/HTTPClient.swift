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
    
    
    func perform<R: Codable>(for endpoint: T, with body:Encodable? = nil, oauthToken: String? = nil) async -> R? {
        
        var request = URLRequest(url: makeURL(for: endpoint))
        request.httpMethod = endpoint.method.rawValue
        
        if let body = body {
            let jsonData = try? JSONEncoder().encode(body)
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        if let oauthToken = oauthToken {
            request.addValue("Bearer \(oauthToken)", forHTTPHeaderField: "Authorization")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            let deseralizer = JSONDecoder()
            return  try deseralizer.decode(R.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
    
    func performData(for endpoint: T) async -> Data? {
        
        var request = URLRequest(url: makeURL(for: endpoint))
        request.httpMethod = endpoint.method.rawValue
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            return  data
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
