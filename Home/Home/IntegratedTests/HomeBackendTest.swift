//
//  HomeBackendTest.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//
import XCTest

@testable import Home

class HomeBackendTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testListComicsSuccess() {
        let repository = RemoteMarvelComicRepository()
        let useCase = MainHomeUseCase(marvelComicRepository: repository)
        
        let exp = expectation(description: "Check if Comics List is successful")

        var success: Bool = false
        
        useCase.execute(completion: { result in
            switch result {
            case .success(let marvelComics):
                print(marvelComics)
                success = true
            case .failure(let error):
                print(error)
            }
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }
}
