import Foundation
@testable import CountriesExercise

class MockNetworkService: NetworkServiceProtocol {
    var shouldSucceed = true
    var mockCountries: [Country] = []
    
    func fetchCountries() async throws -> [Country] {
        if shouldSucceed {
            return mockCountries
        } else {
            throw NSError(domain: "MockError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock network error"])
        }
    }
}