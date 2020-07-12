//
//  ColorCollectionCell.swift
//  Firebase_Demo
//
//  Created by TRT-IOS-03 on 12/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

class ColorCollectionCell: UICollectionViewCell {

    @IBOutlet weak var colorImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setColors(color: UIColor) {
        colorImg.layer.cornerRadius = 0
        self.colorImg.tintColor = color
    }
}
