import Foundation
/// An enumeration representing network errors
/// - Parameters:
///     - invalidURL: The provided URL is invalid.
///     - requestFailed: The network request failed with a specific status code.
///     - decodingFailed: Decoding the response data failed.
///     - networkError: A generic network error.
enum NetworkError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed(Error)
    case networkError(Error)
}
