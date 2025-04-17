import UIKit

// MARK: - UITableViewDataSource
extension CountriesViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.reuseIdentifier, for: indexPath) as! CountryTableViewCell
        let country = filteredCountries[indexPath.row]
        cell.configureTableViewCell(with: country)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}