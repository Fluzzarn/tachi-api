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
    let provider = MoyaProvider<TachiService>(stubClosure: MoyaProvider.immediatelyStub)
    var cancellables = Set<AnyCancellable>()
    func testGetUsers() throws {
        let expectation = XCTestExpectation(description: "printing users")
        provider.requestPublisher(.users(server: .kamaitachi, search: nil)).sink(receiveCompletion: { response in

            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: { response in
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
        provider.requestPublisher(.user(server: .kamaitachi)).sink(receiveCompletion: { response in

            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: { response in
            let decoder = JSONDecoder()
            let userResponse = try! decoder.decode(UserResponse.self, from: response.data)
            XCTAssertEqual(userResponse.user.usernameLowercase, "fluzzarn")
            expectation.fulfill()
        }).store(in: &cancellables)

        wait(for: [expectation], timeout: 3)
    }

    func testGetUserByName() throws {
        let expectation = XCTestExpectation(description: "printing users")
        provider.requestPublisher(.user(server: .kamaitachi, name: "fluzzarn")).sink(receiveCompletion: { response in

            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: { response in
            let decoder = JSONDecoder()
            let userResponse = try! decoder.decode(UserResponse.self, from: response.data)
            XCTAssertEqual(userResponse.user.usernameLowercase, "fluzzarn")
            expectation.fulfill()

        }).store(in: &cancellables)

        wait(for: [expectation], timeout: 3)
    }

    func testGetPFP() throws {
        let expectation = XCTestExpectation(description: "printing users")
        provider.requestPublisher(.profilePicture(server: .kamaitachi, name: "fluzzarn")).sink(receiveCompletion: { response in

            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: { response in
            let userResponse = Image(data: response.data)
            XCTAssertNotNil(userResponse)
            XCTAssertEqual(userResponse?.size.width, 600)
            expectation.fulfill()

        }).store(in: &cancellables)

        wait(for: [expectation], timeout: 3)
    }

    func testGetBanner() throws {
        let expectation = XCTestExpectation(description: "printing users")
        provider.requestPublisher(.banner(server: .kamaitachi, name: "fluzzarn")).sink(receiveCompletion: { response in

            guard case let .failure(error) = response else { return }

            print(error)
        }, receiveValue: { response in
            let userResponse = Image(data: response.data)
            XCTAssertNotNil(userResponse)
            XCTAssertEqual(userResponse?.size.width, 1539)
            expectation.fulfill()

        }).store(in: &cancellables)

        wait(for: [expectation], timeout: 3)
    }
}
