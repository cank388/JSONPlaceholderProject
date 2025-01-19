//
//  AppCoordinator.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 19.01.2025.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init(navigationController: UINavigationController())
    }
    
    override func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        startApp()
    }
    
    /// App starting with User Flow
    private func startApp() {
        let userCoordinator = UserCoordinator(navigationController: navigationController)
        childCoordinators.append(userCoordinator)
        userCoordinator.start()
    }
}
