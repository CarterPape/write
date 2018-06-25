//
//  writeUITests.swift
//  writeUITests
//
//  Created by Carter Pape on 6/22/18.
//  Copyright © 2018 Carter Pape. All rights reserved.
//

import XCTest

class writeUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        XCUIApplication().terminate()
        super.tearDown()
    }
    
    func test_Workflow_Save() {
        let mainWindow = XCUIApplication().windows["Untitled"]
        let textView = mainWindow.scrollViews.children(matching: .textView).element
        
        textView.typeText("This is what it sounds like... when doves cry.")
        textView.typeKey("s", modifierFlags:.command)
        
        let uniqueName = String(Date().timeIntervalSinceReferenceDate)
        let fileNameField = mainWindow.sheets.children(matching: .textField).allElementsBoundByIndex[0]
        
        fileNameField.typeText(uniqueName)
        
        mainWindow.sheets.buttons["Save"].click()
        
        XCTAssertFalse(mainWindow
            .staticTexts
            .matching(NSPredicate(format: "value contains[cd] 'could not be saved'"))
            .element
            .exists,
                  "\"File could not be saved\" dialog showed up")
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
