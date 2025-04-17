/// Constants related to API endpoints.
/// This is an endpoint URL for fetching the list of countries.
/// Returns a JSON array containing country information including:
/// - Name
/// - Region
/// - Code
/// - Capital
enum APIConstants {
  enum Endpoints {
    static let countries = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
  }
}
