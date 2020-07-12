//
//  ProfileListCell.swift
//  Firebase_Demo
//
//  Created by Third Rock Techkno on 11/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

class ProfileListCell: UITableViewCell {

    
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var colorImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLayout()
    }
    
    private func setupLayout() {
        let textGreyColor = UIColor.gray//UIColor(red: 102, green: 102, blue: 102, alpha: 1)
        nameLabel.textColor = UIColor.black
        emailLabel.textColor = UIColor.black
        detailDescriptionLabel.textColor = textGreyColor
        timeLabel.textColor = textGreyColor
        selectionStyle = .none
    }
    
    func setData() {
        nameLabel.text = "Petel Gilles"
        emailLabel.text = "xyz@gmail.com"
        detailDescriptionLabel.text = "detail description"
        timeLabel.text = "22:45"
        colorImageView.tintColor = UIColor.green
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
