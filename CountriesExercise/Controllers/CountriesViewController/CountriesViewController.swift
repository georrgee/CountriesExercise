import UIKit

class CountriesViewController: UIViewController {
  
    // - MARK: Variables
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    let networkService: NetworkServiceProtocol
    var countries: [Country] = []
    var filteredCountries: [Country] = []
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCountries()
    }
    
    // - MARK: Methods
    private func setupUI() {
        
        title = "Countries"
        view.backgroundColor = .systemBackground
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name or capital"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func fetchCountries() {
        Task {
            do {
                countries = try await networkService.fetchCountries()
                filteredCountries = countries
                tableView.reloadData()
            } catch {
                showErrorAlert(message: "Failed to load up countries! Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
}
