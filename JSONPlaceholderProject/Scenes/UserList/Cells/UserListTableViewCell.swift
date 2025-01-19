//
//  UserListTableViewCell.swift
//  JSONPlaceholderProject
//
//  Created by Can Kalender on 18.01.2025.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewModel: UserListTableViewModel) {
        userNameLabel.text = viewModel.username
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
    }
    
}
