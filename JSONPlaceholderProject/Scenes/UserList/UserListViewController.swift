//
//  UserListViewController.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import UIKit

final class UserListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: UserListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
        setupBindings()
        viewModel.fetchUsers()
    }
    
    init(viewModel: UserListViewModelProtocol = UserListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        self.title = "Users"
        self.view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
        
    private func setupBindings() {
        viewModel.onUsersUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.onError = { [weak self] error in
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default))
            self?.present(alert, animated: true)
        }
    }
    
    
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        cell.configure(with: viewModel.users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedUser = viewModel.users[indexPath.row]
        let detailViewModel = UserListDetailViewModel(user: selectedUser)
        let storyboard = UIStoryboard(name: "UserListDetail", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: "UserListDetailViewController") as! UserListDetailViewController
        detailViewController.viewModel = detailViewModel
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
