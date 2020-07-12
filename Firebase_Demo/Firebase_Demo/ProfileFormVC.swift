//
//  ProfileFormVC.swift
//  Firebase_Demo
//
//  Created by TRT-IOS-03 on 12/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

enum rows {
    case firstName
    case lastName
    case email
    case description
    case color
}



class ProfileFormVC: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    
    var dataSourse = [rows]()

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
        tblView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "textFieldCell")
        tblView.register(UINib(nibName: "TextAreaCell", bundle: nil), forCellReuseIdentifier: "textAreaCell")
        tblView.register(UINib(nibName: "ColorCollectionViewCell", bundle: nil), forCellReuseIdentifier: "colorCollectionViewCell")
    }
   
    func setUpDataSourse() {
        dataSourse.append(.firstName)
        dataSourse.append(.lastName)
        dataSourse.append(.email)
        dataSourse.append(.description)
        dataSourse.append(.color)
    }
    
    @IBAction func SaveData(_ sender: UIButton) {
        
    }
}

extension ProfileFormVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = dataSourse[indexPath.row]
        switch row {
        
        case .firstName:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldCell
            cell.setData(title: "First Name", value: nil)
            return cell
            
        case .lastName:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldCell
            cell.setData(title: "Last Name", value: nil)
            return cell
            
        case .email:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldCell
            cell.setData(title: "Email Address", value: nil)
            return cell
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textAreaCell", for: indexPath) as! TextAreaCell
            cell.setData(title: "Description", value: nil)
            return cell

        case .color:
            let cell = tableView.dequeueReusableCell(withIdentifier: "colorCollectionViewCell", for: indexPath) as! ColorCollectionViewCell
            return cell
        }
        
    }
    
    
}

extension ProfileFormVC: UITableViewDelegate {
    
}
