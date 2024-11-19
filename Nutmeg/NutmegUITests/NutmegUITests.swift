//
//  NutmegUITests.swift
//  NutmegUITests
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import XCTest

final class NutmegUITests: XCTestCase {
    func test_whenUserSelectAPost_CommentsAreShowing() {
        // Launch the app
        let app = XCUIApplication()
        let firstCell = app.staticTexts["ui.cell.postId.1"]
        app.launch()

        // Wait for the home screen to appear
        XCTAssertTrue(firstCell.exists)

        // Tap on the first post
        firstCell.tap()
        
        let commentsName = app.staticTexts["ui.text.commentsName.1"]
        XCTAssertTrue(commentsName.exists)
        XCTAssertEqual(commentsName.label, "id labore ex et quam laborum")
    }
}
