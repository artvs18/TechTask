//
//  SigInViewModelTest.swift
//  TechTask
//
//  Created by Artemy Volkov on 26.03.2023.
//

import XCTest
@testable import TechTask

class SignInViewModelTests: XCTestCase {
    var viewModel: SignInViewModel!
    
    override func setUpWithError() throws {
        viewModel = SignInViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testCanSubmit() throws {
        // Given
        viewModel.firstName = "John"
        viewModel.lastName = "Doe"
        viewModel.email = "john.doe@test.com"
        viewModel.password = "password"
        
        // When
        let canSubmit = viewModel.canSubmit
        
        // Then
        XCTAssertTrue(canSubmit)
    }
    
    func testEmailPrompt() throws {
        // Given
        viewModel.email = "john.doe@"
        
        // When
        let emailPrompt = viewModel.emailPrompt
        
        // Then
        XCTAssertEqual(emailPrompt, "Enter valid Email. Example: test@test.com")
    }
    
    func testLogIn() throws {
        // Given
        viewModel.firstName = "John"
        viewModel.password = "password"
        
        // When
        viewModel.logIn()
        
        // Then
        XCTAssertTrue(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.currentUser, "John Doe")
    }
    
    func testRegister() throws {
        // Given
        viewModel.firstName = "John"
        viewModel.lastName = "Doe"
        viewModel.email = "john.doe@test.com"
        viewModel.password = "password"
        
        // When
        viewModel.register()
        
        // Then
        XCTAssertTrue(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.currentUser, "John Doe")
    }
}
