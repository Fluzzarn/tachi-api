//
//  File.swift
//  
//
//  Created by Dan Mclean on 12/13/21.
//

import Foundation
import Combine
import CombineMoya
import Moya
import XCTest
@testable import tachi_api

final class UsersTests: XCTestCase {
    let provider = MoyaProvider<KamaitachiService>(stubClosure: MoyaProvider.immediatelyStub)
    var cancellables = Set<AnyCancellable>()
    func testGetUsers() throws {
        let expectation = XCTestExpectation(description: "printing users")
        provider.requestPublisher(.users(search: nil)).sink(receiveCompletion: { response in
            
            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: {response in
            let decoder = JSONDecoder()
                let userResponse = try! decoder.decode(UsersResponse.self, from: response.data)
                    for user in userResponse.users {
                        print(user.username)
                    }
                    expectation.fulfill()
        }).store(in: &cancellables)
        
        wait(for: [expectation], timeout: 3)
    }
    
    
    func testGetMeUser() throws {
        let expectation = XCTestExpectation(description: "printing users")
        provider.requestPublisher(.user()).sink(receiveCompletion: { response in
            
            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: {response in
            let decoder = JSONDecoder()
            let userResponse = try! decoder.decode(UserResponse.self, from: response.data)
            XCTAssertEqual(userResponse.user.usernameLowercase, "fluzzarn")
                        expectation.fulfill()
        }).store(in: &cancellables)
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testGetUserByName() throws {
        let expectation = XCTestExpectation(description: "printing users")
        provider.requestPublisher(.user(name:"fluzzarn")).sink(receiveCompletion: { response in
            
            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: {response in
                let decoder = JSONDecoder()
                let userResponse = try! decoder.decode(UserResponse.self, from: response.data)
                XCTAssertEqual(userResponse.user.usernameLowercase, "fluzzarn")
                        expectation.fulfill()
            
        }).store(in: &cancellables)
        
        wait(for: [expectation], timeout: 3)
    }
}
