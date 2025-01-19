# JSONPlaceholder Project

This iOS project is used [JSONPlaceholder API](https://jsonplaceholder.typicode.com/).

## Architecture & Design Patterns

- **MVVM (Model-View-ViewModel)** architecture
- **Coordinator** pattern for navigation management (AppCoordinator, Coordinator, UserCoordinator)
- **Repository** pattern for data layer abstraction (UserRepository)
- **Protocol-Oriented Programming** approach 
- **Dependency Injection** principle

## Technical Specifications

- Swift 5
- XCode 15.2
- iOS 17.2
- Unit testing with XCTest
- URLSession-based networking layer
- JSON parsing and encoding/decoding
- Testable architecture with mock objects

## Project Structure
JSONPlaceholderProject/
├── App/
│ ├── AppDelegate.swift
│ └── SceneDelegate.swift
├── Network/
│ ├── Network.swift
│ └── Models/
│   └── UserListModel.swift
│ └── Repository/
│   └── UserRepository.swift
│ └── Endpoints/
│   └── UserEndpoint.swift
└── Tests/
└── JSONPlaceholderProjectTests.swift
└── Scenes/
│ └── UserList/
│   └── UserListViewController.swift
│   └── UserListViewModel.swift
│   └── UserList.storyboard
│   └── Cells/
│     └── UserListTableViewCell.swift
│     └── UserListTableViewCell.xib
│     └── UserListTableViewModel.swift
│ └── UserListDetail/
│   └── UserListDetailViewController.swift
│   └── UserListDetailViewModel.swift
│   └── UserListDetail.storyboard
├── Flows/
│ ├── Coordinator.swift
│ └── AppCoordinator.swift
│ └── UserCoordinator.swift






