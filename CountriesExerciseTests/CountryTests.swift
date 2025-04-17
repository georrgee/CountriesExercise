import XCTest
@testable import CountriesExercise

final class CountryTests: XCTestCase {
    
    func testCountryInitialization() {
        let country = Country(
            capital: "Paris",
            code: "FR",
            name: "France",
            region: "Europe"
        )
        
        XCTAssertEqual(country.capital, "Paris")
        XCTAssertEqual(country.code, "FR")
        XCTAssertEqual(country.name, "France")
        XCTAssertEqual(country.region, "Europe")
    }
    
    func testCountryDecoding() throws {
        let json = """
        {
            "capital": "Paris",
            "code": "FR",
            "name": "France",
            "region": "Europe"
        }
        """.data(using: .utf8)!
        
        let country = try JSONDecoder().decode(Country.self, from: json)
        
        XCTAssertEqual(country.capital, "Paris")
        XCTAssertEqual(country.code, "FR")
        XCTAssertEqual(country.name, "France")
        XCTAssertEqual(country.region, "Europe")
    }
    
    func testCountryEncoding() throws {
        let country = Country(
            capital: "Paris",
            code: "FR",
            name: "France",
            region: "Europe"
        )
        
        let encodedData = try JSONEncoder().encode(country)
        let decodedCountry = try JSONDecoder().decode(Country.self, from: encodedData)
        
        XCTAssertEqual(country.capital, decodedCountry.capital)
        XCTAssertEqual(country.code, decodedCountry.code)
        XCTAssertEqual(country.name, decodedCountry.name)
        XCTAssertEqual(country.region, decodedCountry.region)
    }
}