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

class collectionCell: UITableViewCell {

    @IBOutlet weak var colorCollectionView: UICollectionView!
    var isSelect = [IndexPath]()
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
extension collectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorPicker.dataSourse.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionCell", for: indexPath) as! ColorCollectionCell
        cell.setColors(color: colorPicker.dataSourse[indexPath.row] ?? UIColor.black)
        return cell
    }
    
    
}

extension collectionCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = colorCollectionView.cellForItem(at: indexPath) as? ColorCollectionCell else { return }
        if isSelect.contains(indexPath) ?? false {
            cell.colorImg.image = #imageLiteral(resourceName: "squareFill").withTintColor(colorPicker.dataSourse[indexPath.row])
            guard let index = isSelect.index(of: indexPath) else { return  }
            isSelect.remove(at: index)
        }
        else {
            isSelect.append(indexPath)
            cell.colorImg.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(colorPicker.dataSourse[indexPath.row])
        }
    }
}
