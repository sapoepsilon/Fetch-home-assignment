//
//  Fetch_home_assignmentUITests.swift
//  Fetch home assignmentUITests
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import XCTest

final class Fetch_home_assignmentUITests: XCTestCase {
	
	override func setUpWithError() throws {
		continueAfterFailure = false
		let app = XCUIApplication()
		app.launchArguments = ["-UITest"]
		app.launch()
	}
	
	func testLaunchPerformance() throws {
		if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
			measure(metrics: [XCTApplicationLaunchMetric()]) {
				XCUIApplication().launch()
			}
		}
	}

	func testNavigationToDetailViewAndBack() throws {
		let app = XCUIApplication()
		
		let firstCell = app.cells.firstMatch
		if firstCell.waitForExistence(timeout: 10) {
			
			let detailTitle = app.staticTexts["mealNavigationDetailTitle"]
			let exists = NSPredicate(format: "exists == 1")
			
			expectation(for: exists, evaluatedWith: detailTitle, handler: nil)
			waitForExpectations(timeout: 10, handler: nil)
			
			XCTAssertTrue(detailTitle.exists, "Navigation to the detail view failed or the detail view's title didn't appear.")
		} else {
			XCTFail("The first cell in the list does not exist.")
		}
	}
	
	func testInstructionsToggle() throws {
		let app = XCUIApplication()
		
		let firstCell = app.cells.firstMatch
		if firstCell.waitForExistence(timeout: 10) {
			firstCell.tap()
			
			let instructionsToggle = app.switches["InstructionToggle"]
			XCTAssertTrue(instructionsToggle.waitForExistence(timeout: 10), "The Instructions toggle does not exist.")
			instructionsToggle.tap()
			
			let instructionsText = app.staticTexts.matching(identifier: "InstructionsText").firstMatch
			XCTAssertTrue(instructionsText.waitForExistence(timeout: 10), "Instructions text should be visible after tapping toggle.")
			
			instructionsToggle.tap()
			XCTAssertTrue(!instructionsText.waitForExistence(timeout: 10), "Instructions text should not be visible after tapping toggle.")

		} else {
			XCTFail("The first cell in the list does not exist.")
		}
	}
	
	func testIngredientsToggle() throws {
		let app = XCUIApplication()
		
		let firstCell = app.cells.firstMatch
		if firstCell.waitForExistence(timeout: 10) {
			firstCell.tap()

			let ingredientsToggle = app.switches["IngredientsToggle"]
			XCTAssertTrue(ingredientsToggle.waitForExistence(timeout: 10), "The IngredientsToggle toggle does not exist.")
			ingredientsToggle.tap()
			
			let ingredientsText = app.staticTexts.matching(identifier: "IngredientsText").firstMatch
			XCTAssertTrue(ingredientsText.waitForExistence(timeout: 10), "Instructions text should be visible after tapping toggle.")
			
			ingredientsToggle.tap()
			XCTAssertTrue(!ingredientsText.waitForExistence(timeout: 10), "Instructions text should not be visible after tapping toggle.")
			
		} else {
			XCTFail("The first cell in the list does not exist.")
		}
	}
}
