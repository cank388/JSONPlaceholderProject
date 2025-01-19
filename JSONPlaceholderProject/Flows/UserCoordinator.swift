//
//  UserCoordinator.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 19.01.2025.
//

import UIKit

protocol UserCoordinatorDelegate: AnyObject {
    func userCoordinatorDidFinish(_ coordinator: UserCoordinator)
}

final class UserCoordinator: BaseCoordinator {
    weak var delegate: UserCoordinatorDelegate?
    
    override func start() {
        showUserList()
    }
    
    private func showUserList() {
        let storyboard = UIStoryboard(name: "UserList", bundle: nil)
        let userListVC = storyboard.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        userListVC.viewModel = UserListViewModel()
        userListVC.delegate = self
        navigationController.pushViewController(userListVC, animated: true)
    }
    
    private func showUserDetail(for user: User) {
        let detailViewModel = UserListDetailViewModel(user: user)
        let storyboard = UIStoryboard(name: "UserListDetail", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: "UserListDetailViewController") as! UserListDetailViewController
        detailViewController.viewModel = detailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UserListViewControllerDelegate
extension UserCoordinator: UserListViewControllerDelegate {
    func userListViewController(_ controller: UserListViewController, didSelectUser user: User) {
        showUserDetail(for: user)
    }
}
