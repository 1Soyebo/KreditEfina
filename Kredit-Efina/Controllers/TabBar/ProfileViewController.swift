//
//  ProfileViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileCardView: UIView!
    @IBOutlet weak var tblProfile: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!
    let cellTitles = ["Update Profile","Bank Information","Help and Support","Share with friends","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        HelperClass.curveUiElements(views: profileCardView)
        tblProfile.dataSource = self
        tblProfile.delegate = self
        tblProfile.register(UINib(nibName: ProfileTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tblProfile.tableFooterView = UIView()
        imgProfile.layer.cornerRadius = imgProfile.frame.size.height/2
        // Do any additional setup after loading the view.
    }
    

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsCell = tblProfile.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        settingsCell.lblTitle.text = cellTitles[indexPath.row]
        settingsCell.selectionStyle = .none
        return settingsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblProfile.deselectRow(at: indexPath, animated: true)
    }
    
    
}
