//
//  UserListDetailViewController.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import UIKit

final class UserListDetailViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var directToWebsiteButton: UIButton!
    
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
        view.backgroundColor = .systemBackground
    }
    
    private func configureUI() {
        guard let viewModel = viewModel else { return }
        
        /// If name is not exist, set the navigation title as "User Detail"
        if !viewModel.name.isEmpty {
            self.title = viewModel.name
        } else {
            self.title = "User Detail"
        }
        emailLabel.text = viewModel.email
        companyLabel.text = viewModel.company
        
        /// If website url is not exist, hide the button
        if viewModel.website.absoluteString.isEmpty {
            directToWebsiteButton.isHidden = true
        }
    }
    
    @IBAction func directToWebsiteButtonTapped(_ sender: UIButton) {
        if let url = viewModel?.website {
            UIApplication.shared.open(url)
        }
    }
}
