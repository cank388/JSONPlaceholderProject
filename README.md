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
```
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
```
<img src="https://github.com/user-attachments/assets/22e72748-d304-4485-b123-05ab2ff61123" alt="image" width="300">
<img src="https://github.com/user-attachments/assets/46a598c6-4fef-44d9-aff2-e79975caac52" alt="image" width="300">





