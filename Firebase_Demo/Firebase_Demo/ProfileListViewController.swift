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
    private var dataSource = [Any]() {
        didSet {
            emptyDataImageView.isHidden = !dataSource.isEmpty
            tableView.isHidden = dataSource.isEmpty
        }
    }
    
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let deleteAlert = UIAlertController(title: "Delete", message: "Are You sure You want to delete this profile? ", preferredStyle: UIAlertController.Style.alert)
                deleteAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
                    
                    self.dataSource.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    
                }))
                deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                    deleteAlert .dismiss(animated: true, completion: nil)
                }))
                present(deleteAlert, animated: true, completion: nil)
                
            }
        }
    @IBAction func createProfile(_ sender: UIButton) {
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileFormVC") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ProfileListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileFormVC") as! UIViewController
        vc.navigationItem.title = "Update Profile"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
