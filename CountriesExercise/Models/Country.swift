import Foundation
/// Struct that represents a country with its country code, name, region, and capital city.
/// - Parameters:
///   - code: The country code of the country.
///   - name: The name of the country.
///   - region: The region of the country.
///   - capital: The capital city of the country.
/// - Returns: A `Country` struct with the provided dat
struct Country: Codable {
  let capital:     String
  let code:        String
  let name:        String
  let region:      String
}