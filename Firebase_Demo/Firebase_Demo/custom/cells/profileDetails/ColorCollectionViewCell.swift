//
//  collectionViewCellTableViewCell.swift
//  Firebase_Demo
//
//  Created by TRT-IOS-03 on 12/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

struct clrPicker {
    var dataSourse = [UIColor.blue, UIColor.purple, UIColor.green, UIColor.red, UIColor.orange]
}

class ColorCollectionViewCell: UITableViewCell {

    @IBOutlet weak var colorCollectionView: UICollectionView!
    var selectedColorIndexPath: IndexPath?
    var colorPicker : clrPicker = clrPicker()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setUpDataSourse()
        setUpCollectionView()

    }
    func setUpCollectionView() {
         
         colorCollectionView.allowsMultipleSelection = false
         colorCollectionView.delegate = self
         colorCollectionView.dataSource = self
         self.colorCollectionView.register(UINib(nibName: "ColorCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ColorCollectionCell")
        
     }
    
    func setUpDataSourse() {
        colorPicker.dataSourse = [UIColor.blue, UIColor.purple, UIColor.green, UIColor.red, UIColor.orange]
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ColorCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorPicker.dataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionCell", for: indexPath) as! ColorCollectionCell
        cell.setColors(color: colorPicker.dataSourse[indexPath.row] )
        cell.colorImg.image = indexPath == selectedColorIndexPath ? UIImage(systemName: "checkmark.circle.fill")?.withTintColor(colorPicker.dataSourse[indexPath.row]) : #imageLiteral(resourceName: "squareFill").withTintColor(colorPicker.dataSourse[indexPath.row])
        return cell
    }
    
    
}

extension ColorCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = colorCollectionView.cellForItem(at: indexPath) as? ColorCollectionCell else { return }
        if let selectedColorIndexPath = self.selectedColorIndexPath {
            self.selectedColorIndexPath = nil
            collectionView.reloadItems(at: [selectedColorIndexPath])
        }
        self.selectedColorIndexPath = indexPath
        collectionView.reloadItems(at: [indexPath])
    }
}
