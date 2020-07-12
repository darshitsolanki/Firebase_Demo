//
//  ProfileFormVC.swift
//  Firebase_Demo
//
//  Created by TRT-IOS-03 on 12/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

enum rows {
    case txtField
    case txtArea
    case colorPicker
}



class ProfileFormVC: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    
    var dataSourse = [Any]()
    var ds = [rows]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Profile"
        setUpDataSourse()
        setUpTableView()
    }
    
    func setUpTableView() {
        
        self.navigationItem.backBarButtonItem?.title = "c"
        
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.separatorStyle = .none
        tblView.register(UINib(nibName: "txtFieldCell", bundle: nil), forCellReuseIdentifier: "txtFieldCell")
        tblView.register(UINib(nibName: "txtAreaCell", bundle: nil), forCellReuseIdentifier: "txtAreaCell")
        tblView.register(UINib(nibName: "collectionCell", bundle: nil), forCellReuseIdentifier: "collectionCell")
    }
   
    func setUpDataSourse() {
        dataSourse = ["First Name" , "Last Name", "Email Address",  "Description", "Color Picker"]
        ds = [ .txtField , .txtField , .txtField , .txtArea, .colorPicker ]
    }
    @IBAction func SaveData(_ sender: UIButton) {
    }
}

extension ProfileFormVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ds.count//dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = ds[indexPath.row]
        switch row {
        case .txtField:
            let cell = tblView.dequeueReusableCell(withIdentifier: "txtFieldCell", for: indexPath) as! txtFieldCell
            guard let text = dataSourse[indexPath.row] as? String else { return UITableViewCell() }
            cell.txtField.placeholder = text
            cell.setText(text: cell.txtField.text ?? text)
            return cell
        case .colorPicker:
            let cell = tblView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath) as! collectionCell
            return cell
        case .txtArea :
            let cell = tblView.dequeueReusableCell(withIdentifier: "txtAreaCell", for: indexPath) as! txtAreaCell
            guard let text = dataSourse[indexPath.row] as? String else { return UITableViewCell() }
            cell.descriptionArea.text = text
            cell.setText(text: cell.textArea.text ?? text)
            return cell
        }
        
    }
    
    
}

extension ProfileFormVC: UITableViewDelegate {
    
}
