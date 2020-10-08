//
//  LoginViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit
import PKHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblWelcome: UILabel!
    
    let btnHideShowPassword:UIButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        HelperClass.curveUiElements(views: txtPassword,btnLogin)
        txtPassword.isSecureTextEntry = true
        configurePasswordtxt()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lblWelcome.text = "Welcome Back, \(HelperClass.currentUser?.username ?? "")"
    }
    
    fileprivate func configurePasswordtxt(){
        let plainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let keyimage = UIImageView(image: UIImage(named: "key-password"))
        plainView.addSubview(keyimage)
        keyimage.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        txtPassword.leftView = plainView
        txtPassword.leftViewMode = .always
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnHideShowPassword.setImage(UIImage(named: "blue-closed-eye"), for: .normal)
        btnHideShowPassword.setImage(UIImage(named: "blue-open-eye"), for: .selected)
        btnHideShowPassword.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        btnHideShowPassword.frame = CGRect(x: CGFloat(txtPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        btnHideShowPassword.addTarget(self, action: #selector(self.hideShowPassword), for: .touchUpInside)
        txtPassword.rightView = btnHideShowPassword
        txtPassword.rightViewMode = .always
    }
    
    @IBAction func hideShowPassword(_ sender: Any) {
        btnHideShowPassword.isSelected.toggle()
        txtPassword.isSecureTextEntry.toggle()
    }
    
    
    
    @IBAction func handleLogin(_ sender: Any) {
        HUD.show(.progress)
        if txtPassword.text!.isEmpty{
            HUD.flash(.label("Please enter your password"),delay: 1)
            return
        }
        if HelperClass.currentUser?.password != txtPassword.text!{
            HUD.flash(.label("Password is incorrect, try again 🥺"),delay: 1)
            return
        }
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBar = storyboard.instantiateViewController(withIdentifier: "Kredit-Tabbar")
        
        self.navigationController?.pushViewController(tabBar, animated: true)
        //HUD.hide()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
