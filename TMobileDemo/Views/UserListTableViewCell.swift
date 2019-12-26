//
//  UserListTableViewCell.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import UIKit
import Kingfisher

class UserListTableViewCell: UITableViewCell {

    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblRepoCount: UILabel!
    
    var user: User? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setData() {
        if let url = URL(string: user?.avatarUrl ?? "") {
            imgUser.kf.setImage(with: url)
        }
        lblUserName.text = user?.login
        lblRepoCount.text = "" // "Repo: N/A"
        
    }
}
