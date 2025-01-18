//
//  UserListDetailViewController.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import UIKit

final class UserListDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    var viewModel: UserListDetailViewModelProtocol?
    
    init(viewModel: UserListDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureUI()
    }
    
    private func setupViews() {
        title = "User Detail"
        view.backgroundColor = .systemBackground
    }
    
    private func configureUI() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = "\(viewModel.user.name ?? "")"
        emailLabel.text = "\(viewModel.user.email ?? "")"
        companyLabel.text = "\(viewModel.user.company?.name ?? "")"
    }
}
