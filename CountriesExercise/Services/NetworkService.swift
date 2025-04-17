import Foundation
/// Protocol defining the contract for network operations related to country data
protocol NetworkServiceProtocol {
    func fetchCountries() async throws -> [Country]
}

/// Fetches country data from the remote API
    /// - Returns: An array of decoded Country objects
    /// - Throws: Various NetworkError cases depending on the failure type
final class NetworkService: NetworkServiceProtocol {

    private let endpoint = APIConstants.Endpoints.countries
    
    func fetchCountries() async throws -> [Country] {
        
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.requestFailed(statusCode: 0)
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed(statusCode: httpResponse.statusCode)
            }
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode([Country].self, from: data)
            } catch {
                throw NetworkError.decodingFailed(error)
            }
            
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.networkError(error)
        }
    }
}
