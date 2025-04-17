import XCTest
@testable import CountriesExercise

@MainActor
class CountriesViewControllerTests: XCTestCase {
    
    var sut: CountriesViewController!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = CountriesViewController(networkService: mockNetworkService)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testSuccessfulCountriesFetch() async throws {
        let mockCountries = [
            Country(capital: "Lima", code: "PE", name: "Peru", region: "SA"),
            Country(capital: "Washington, D.C.", code: "US", name: "United States of America", region: "NA"),
        ]
        
        mockNetworkService.mockCountries = mockCountries
        mockNetworkService.shouldSucceed = true        

        await Task { @MainActor in
            await sut.fetchCountries()
        }.value        
        
        XCTAssertFalse(sut.countries.isEmpty, "Countries array should not be empty")
        XCTAssertEqual(sut.countries.count, 2)
        XCTAssertEqual(sut.filteredCountries.count, 2)
        if !sut.countries.isEmpty {
            XCTAssertEqual(sut.countries[0].name, "Peru")
        }    
    }
    
    func testFailedCountriesFetch() async throws {
        
        mockNetworkService.shouldSucceed = false
        await sut.fetchCountries()
        
        XCTAssertTrue(sut.countries.isEmpty)
        XCTAssertTrue(sut.filteredCountries.isEmpty)
    }
    
    func testSearchFunctionality() {
        
        let mockCountries = [
            Country(capital: "Lima", code: "PE", name: "Peru", region: "SA"),
            Country(capital: "Washington, D.C.", code: "US", name: "United States of America", region: "NA"),
        ]
        
        sut.countries = mockCountries
        sut.filteredCountries = mockCountries
        
        sut.searchController.searchBar.text = "Lima"
        sut.updateSearchResults(for: sut.searchController)
        
        XCTAssertEqual(sut.filteredCountries.count, 1)
        
        sut.searchController.searchBar.text = "United States of America"
        sut.updateSearchResults(for: sut.searchController)
        
        XCTAssertEqual(sut.filteredCountries.count, 1)
        XCTAssertEqual(sut.filteredCountries[0].name, "United States of America")
    }
}
