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
    let cellImages = ["blue-profile","icon-security","icon-help","icon-share","icon-logout"]
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
        settingsCell.imgMain.image = UIImage(named: cellImages[indexPath.row])
        settingsCell.selectionStyle = .none
        return settingsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblProfile.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 4{
            let alertController = UIAlertController(title: "Log Out", message: "Do you want to log out", preferredStyle: .alert)
            alertController.addAction(.init(title: "Yes", style: .default, handler: {Void in
                let stroyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVc = stroyboard.instantiateInitialViewController()
                loginVc?.modalPresentationStyle = .fullScreen
                if let loginVc = loginVc{
                    self.present(loginVc, animated: true, completion: nil)
                }
            }))
            alertController.addAction(.init(title: "No", style: .cancel, handler: {Void in}))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
