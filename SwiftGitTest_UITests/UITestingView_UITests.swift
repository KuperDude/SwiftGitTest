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
        //app.launchArguments = ["-UITest_UserSignUp"]
        app.launch()

    }

    override func tearDownWithError() throws {}

    func test_UITestingView_signUpButton_shouldPresentHomeView() {
        //Given
        
        //When
        signInAndSignUp(onTapingKeyboard: true)
        
        //Then
        let navTitle = app.navigationBars["Home View"].staticTexts["Home View"]
        XCTAssertTrue(navTitle.exists)
        
    }
    
    func test_UITestingView_signUpButton_shouldNotPresentHomeView() {
        //Given
        
        //When
        signInAndSignUp(onTapingKeyboard: false)
        
        //Then
        let navTitle = app.navigationBars["Home View"].staticTexts["Home View"]
        XCTAssertFalse(navTitle.exists)
        
    }
    
    func test_UITestingView_helloAlert_shouldPresentsInHomeViewAndDissapear() {
        
        //Given
        signInAndSignUp(onTapingKeyboard: true)
        
        //When
        showHelloAlert(dissmiss: true)
        
        //Then
        XCTAssertFalse(app.alerts.firstMatch.waitForExistence(timeout: 1))
        
    }
    
    func test_UITestingView_helloAlert_shouldPresentsInHome() {
        
        //Given
        signInAndSignUp(onTapingKeyboard: true)
        
        //When
        showHelloAlert(dissmiss: false)
        
        //Then
        XCTAssertTrue(app.alerts.firstMatch.waitForExistence(timeout: 1))

    }
    
    func test_UITestingView_link_shouldPresentsDestanationAndDissmiss() {
        
        //Given
        signInAndSignUp(onTapingKeyboard: true)
        
        //When
        showDestanation(dismiss: true)
        
        //Then
        let navTitle = app.navigationBars["Home View"].staticTexts["Home View"]
        XCTAssertTrue(navTitle.exists)
        
    }
    
    func test_UITestingView_link_shouldPresentsDestanation() {
        
        //Given
        signInAndSignUp(onTapingKeyboard: true)
        
        //When
        showDestanation(dismiss: false)
        
        //Then
        let destanation = app.staticTexts["Destanation"]
        XCTAssertTrue(destanation.exists)
    }
}

// MARK: - Sub functions

extension UITestingView_UITests {
    
    func signInAndSignUp(onTapingKeyboard: Bool) {
        let textField = app.textFields["TextFieldForLogin"]
        textField.tap()
        
        if onTapingKeyboard {
            let GKey = app.keys["G"]
            GKey.tap()
            
            let gKey = app.keys["g"]
            gKey.tap()
            gKey.tap()
        }
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let loginButton = app.buttons["SignUpButton"]
        loginButton.tap()
    }
    
    func showHelloAlert(dissmiss: Bool) {
        let showAlertButton = app.buttons["ShowAlert"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 1))
        
        if dissmiss {
            let alertOKButton = alert.scrollViews.otherElements.buttons["OK"]
            alertOKButton.tap()
        }
    }
    
    func showDestanation(dismiss: Bool) {
        let linkButton = app.buttons["Link"]
        XCTAssertTrue(linkButton.waitForExistence(timeout: 1))
        linkButton.tap()
        
        if dismiss {
            let navBackButton = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Home View"]
            navBackButton.tap()
        }
    }
}
