//
//  DetailTableViewCell.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 07/12/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblForks: UILabel!
    @IBOutlet var lblStar: UILabel!
    
    var repo: RepoModel? {
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
        lblName.text = repo?.name
        lblForks.text = "\(repo?.forksCount ?? 0) forks"
        lblStar.text = "\(repo?.stargazersCount ?? 0) stars"
    }

}
