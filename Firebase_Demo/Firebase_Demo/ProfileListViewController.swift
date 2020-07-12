//
//  ProfileListViewController.swift
//  Firebase_Demo
//
//  Created by Third Rock Techkno on 11/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

class ProfileListViewController: UIViewController {

    @IBOutlet weak var createProfileButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyDataImageView: UIImageView!
    private var dataSource = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.setupTableData()
        self.setupTableView()
    }
    
    private func setupTableData() {
        dataSource = [1,2,3]
    }
    
    private func setupTableView() {
        tableView.isHidden = dataSource.isEmpty
        emptyDataImageView.isHidden = !dataSource.isEmpty
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: "ProfileListCell", bundle: nil), forCellReuseIdentifier: "profileListCell")
    }
    
}

extension ProfileListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileListCell", for: indexPath) as! ProfileListCell
        cell.setData()
        return cell
    }
    
}

extension ProfileListViewController: UITableViewDelegate {
    
}
