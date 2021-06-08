import XCTest
@testable import CountryBrowser

class CountryBrowserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecodingJSONToCountryModel() throws {

        let decodedResponse = try TestObjects.jsonDecoder.decode([Country].self,
                                                                 from: TestObjects.validCountriesAPIResponseJSON)

        XCTAssertEqual(decodedResponse.count, 1)

        XCTAssertEqual(decodedResponse.first!.name, "Afghanistan")
        XCTAssertEqual(decodedResponse.first!.capital, "Kabul")
        XCTAssertEqual(decodedResponse.first!.population, 27657145)
        XCTAssertEqual(decodedResponse.first!.location, Country.Location(latitude: 33.0,
                                                                         longitude: 65.0))
    }
}
