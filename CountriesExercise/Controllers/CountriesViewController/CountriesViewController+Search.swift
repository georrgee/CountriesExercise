import UIKit

// MARK: - UISearchResultsUpdating
extension CountriesViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased(), !searchText.isEmpty else {
            filteredCountries = countries
            tableView.reloadData()
            return
        }
        
        filteredCountries = countries.filter { country in
            country.name.lowercased().contains(searchText) ||
            country.capital.lowercased().contains(searchText)
        }
        
        tableView.reloadData()
    }
}