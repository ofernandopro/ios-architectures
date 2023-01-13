//
//  iOSArchitecturesTests.swift
//  iOSArchitecturesTests
//
//  Created by Fernando Moreira on 12/01/23.
//

import XCTest
@testable import iOSArchitectures

class iOSArchitecturesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testLogin() throws {
//        let manager = UserManager(business: UserBusiness())
//        
//        manager.login(email: "aaaaa", password: "aaaa") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error)
//        }
//        
//        manager.login(email: "test@test.com", password: "a12345") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error)
//        }
//    }
    
    func testRegister() {
        var userModel = UserModel()
        
        let exp = expectation(description: "Check Login is successful")
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: "test@test.com", password: "a12345") { userM in
            print(userM)
            userModel = userM
        } failureHandler: { error in
            print(error)
        }
        
        waitForExpectations(timeout: 2) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(userModel != nil, true)
        }

    }

}
