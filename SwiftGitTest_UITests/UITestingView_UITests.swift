//
//  UITestingView_UITests.swift
//  SwiftGitTest_UITests
//
//  Created by MyBook on 23.06.2024.
//

import XCTest

final class UITestingView_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()

    }

    override func tearDownWithError() throws {}

    func test_UITestingView_signUpButton_shouldPresentHomeView() {
        //Given
        let textField = app.textFields["TextFieldForLogin"]
        
        //When
        textField.tap()
        
        let GKey = app.keys["G"]
        GKey.tap()
        
        let gKey = app.keys["g"]
        gKey.tap()
        gKey.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let loginButton = app.buttons["SignUpButton"]
        loginButton.tap()
        
        let navTitle = app.navigationBars["Home View"].staticTexts["Home View"]
        
        //Then
        
        XCTAssertTrue(navTitle.exists)
        
    }
    
    func test_UITestingView_signUpButton_shouldNotPresentHomeView() {
        //Given
        let textField = app.textFields["TextFieldForLogin"]
        
        //When
        textField.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let loginButton = app.buttons["SignUpButton"]
        loginButton.tap()
        
        let navTitle = app.navigationBars["Home View"].staticTexts["Home View"]
        
        //Then
        
        XCTAssertFalse(navTitle.exists)
        
    }
    
    func test_UITestingView_helloAlert_shouldPresentsInHomeViewAndDissapear() {
        
        //Given
        let textField = app.textFields["TextFieldForLogin"]
        
        //When
        textField.tap()
        
        let GKey = app.keys["G"]
        GKey.tap()
        
        let gKey = app.keys["g"]
        gKey.tap()
        gKey.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let loginButton = app.buttons["SignUpButton"]
        loginButton.tap()
        
        let navTitle = app.navigationBars["Home View"].staticTexts["Home View"]
        XCTAssertTrue(navTitle.exists)
        
        let showAlertButton = app.buttons["ShowAlert"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 1))

        let alertOKButton = alert.scrollViews.otherElements.buttons["OK"]
        alertOKButton.tap()
        
        //Then
        
        XCTAssertFalse(alert.waitForExistence(timeout: 1))
        
    }
    
    func test_UITestingView_helloAlert_shouldPresentsInHome() {
        
        //Given
        let textField = app.textFields["TextFieldForLogin"]
        
        //When
        textField.tap()
        
        let GKey = app.keys["G"]
        GKey.tap()
        
        let gKey = app.keys["g"]
        gKey.tap()
        gKey.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let loginButton = app.buttons["SignUpButton"]
        loginButton.tap()
        
        let navTitle = app.navigationBars["Home View"].staticTexts["Home View"]
        XCTAssertTrue(navTitle.exists)
        
        let showAlertButton = app.buttons["ShowAlert"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        
        //Then
        
        XCTAssertTrue(alert.waitForExistence(timeout: 1))

    }
}
