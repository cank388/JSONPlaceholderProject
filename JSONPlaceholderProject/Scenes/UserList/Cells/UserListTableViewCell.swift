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
        // Initialization code
    }

    func configure(with user: User) {
        userNameLabel.text = user.username
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
    
}
