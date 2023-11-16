//
//  LoginBackendTest.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//
import XCTest

@testable import Login

class LoginBackendTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testLoginSuccess() {
        let datasource = UserRemoteDataSource()
        let repository = RemoteMarvelUserRepository(dataSource: datasource)
        
        let exp = expectation(description: "Check Login is successful")
        var success: Bool = false
        
        repository.performLogin(
            username: "admin",
            password: "123456",
            completion: { result in
                print("received data from backend")
                
                exp.fulfill()
                success = true
            }
        )

        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }
}
