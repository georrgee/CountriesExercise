# Countries Exercise
A simple swift application that displays a list of countries with their details

## Features
- Fetch and display list of countries
- Search functionality to filter countries
- Display country details including:
  - Name
  - Capital
  - Region
  - Country Code

## Tech Stack
- Swift
- UIKit
- XCTest for unit testing
- MVVM Architecture
- Async/Await for network calls

## Requirements
- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Architecture
The project follows the MVVM architecture pattern:
- Model: We have a County Model
- View: UI components like UITableView, UIViewController, UISearchBar
- ViewModel: Handles the business logic and data manipulation
- NetworkService: Handles API calls and data fetching

## Testing
The project includes unit tests covering:
- Network service functionality
- View Controller behavior
- Search functionality
- Data parsing
You can run the tests in Xcode by using the keyboard shortcut: ⌘ + U

## Author
George Garcia