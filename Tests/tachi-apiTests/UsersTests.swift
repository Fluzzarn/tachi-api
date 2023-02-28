//
//  File.swift
//
//
//  Created by Dan Mclean on 12/13/21.
//

import Combine
import CombineMoya
import Foundation
import Moya
@testable import tachi_api
import XCTest

final class UsersTests: XCTestCase {
    let client = KamaitachiClient()

    func testGetGPT() async throws {
       
        let games = await client.getGames()
        guard let games = games else {
            XCTFail()
            return
        }
        let game = games.supportedGames[0]
        let config = games.configs[game]
        
        guard let config = config else {
            XCTFail()
            return
        }
        let playType = config.playtypes[0]
        
        guard let gpt = await client.getGamePTConfig(name: game, playtype: playType) else {
            XCTFail()
            return
        }
        print(gpt)
    }
    
    func testGetTables() async throws {
        let games = await client.getGames()
        guard let games = games else {
            XCTFail()
            return
        }
        let game = games.supportedGames[0]
        let config = games.configs[game]
        
        guard let config = config else {
            XCTFail()
            return
        }
        let playType = config.playtypes[0]
        let folders = await client.getTables(for: game, playtype: playType)
        print(folders)
    }
    
    
    func testGetFolder() async throws {
        let games = await client.getGames()
        guard let games = games else {
            XCTFail()
            return
        }
        let game = games.supportedGames[0]
        let config = games.configs[game]
        
        guard let config = config else {
            XCTFail()
            return
        }
        let playType = config.playtypes[0]
        let folders = await client.getTables(for: game, playtype: playType)
        let level12 = folders?.last?.folders.last
        guard let folder = await client.getFolder(for: game, playtype: playType, with: level12!) else {
            XCTFail()
            return
        }
        for chart in folder.charts {
            let song = folder.songs.first(where: {$0.id == chart.songID
            })
            print("\(song?.title ?? "") (\(chart.difficulty ?? "")): \(chart.data?.ncTier?.value ?? 0.0) ")
        }
        
    }
}
