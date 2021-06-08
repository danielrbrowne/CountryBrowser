import XCTest

class CountryBrowserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCountryDetailView() throws {

        let app = XCUIApplication()
        app.launch()

        app.tables.cells.element(boundBy: 0).tap()

        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryNameLabel").element.label, "Afghanistan")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryCapitalLabel").element.label, "Capital: Kabul")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryPopulationLabel").element.label, "Population: 27,657,145")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryLocationLabel").element.label, "Location: 33.000000, 65.000000")

        app.navigationBars["Details"].buttons["Countries List"].tap()
    }

    func testSortButton() throws {
        let app = XCUIApplication()
        app.launch()

        app.navigationBars["Countries List"]/*@START_MENU_TOKEN@*/.buttons["SortButton"]/*[[".buttons[\"Sort Z - A\"]",".buttons[\"SortButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables.cells.element(boundBy: 1).tap()

        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryNameLabel").element.label, "Zimbabwe")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryCapitalLabel").element.label, "Capital: Harare")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryPopulationLabel").element.label, "Population: 14,240,168")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryLocationLabel").element.label, "Location: -20.000000, 30.000000")

        app.navigationBars["Details"].buttons["Countries List"].tap()
        app.navigationBars["Countries List"]/*@START_MENU_TOKEN@*/.buttons["SortButton"]/*[[".buttons[\"Sort Z - A\"]",".buttons[\"SortButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables.cells.element(boundBy: 0).tap()

        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryNameLabel").element.label, "Afghanistan")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryCapitalLabel").element.label, "Capital: Kabul")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryPopulationLabel").element.label, "Population: 27,657,145")
        XCTAssertEqual(app.staticTexts.matching(identifier: "CountryLocationLabel").element.label, "Location: 33.000000, 65.000000")
    }
}
