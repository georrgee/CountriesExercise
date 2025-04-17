import UIKit

class CountryTableViewCell: UITableViewCell {
    
    // - MARK: Variables
    
    static let reuseIdentifier = "CountryTableViewCell"
    
    // - MARK: UILabels
    
    private let regionNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0;
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let countryCodeLabel: UILabel = {
        let label   = UILabel()
        label.font  = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.font  = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableViewCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - MARK: Methods
    
    private func setupTableViewCellUI() {
        contentView.addSubview(regionNameLabel)
        contentView.addSubview(countryCodeLabel)
        contentView.addSubview(capitalLabel)
        
        regionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            regionNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            regionNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            regionNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: countryCodeLabel.leadingAnchor, constant: -8),
            
            countryCodeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            countryCodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            countryCodeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            capitalLabel.topAnchor.constraint(equalTo: regionNameLabel.bottomAnchor, constant: 4),
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            capitalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        regionNameLabel.isAccessibilityElement = false
        countryCodeLabel.isAccessibilityElement = false
        capitalLabel.isAccessibilityElement = false
        isAccessibilityElement = true
    }
    
    func configureTableViewCell(with country: Country) {
        regionNameLabel.text = "\(country.name),  \(country.region)"
        countryCodeLabel.text = country.code
        capitalLabel.text = country.capital
        accessibilityLabel = "\(country.name), \(country.region), Country Code: \(country.code), Capital: \(country.capital)"
    }
}
