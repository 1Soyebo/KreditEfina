//
//  FullLoginViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import UIKit
import PKHUD

class FullLoginViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblWelcome: UILabel!
    
    let btnHideShowPassword:UIButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        HelperClass.curveUiElements(views: txtPassword,btnLogin,txtUsername)
        txtPassword.isSecureTextEntry = true
        configurePasswordtxt()
        configureEmailtxt()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        lblWelcome.text = "Welcome Back, \(HelperClass.currentUser?.username ?? "")"
//    }
    
    fileprivate func configurePasswordtxt(){
        let plainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let keyimage = UIImageView(image: UIImage(named: "key-password"))
        plainView.addSubview(keyimage)
        keyimage.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        txtPassword.leftView = plainView
        txtPassword.leftViewMode = .always
        
    }
    
    fileprivate func configureEmailtxt(){
        let plainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let keyimage = UIImageView(image: UIImage(named: "email logo"))
        plainView.addSubview(keyimage)
        keyimage.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        txtUsername.leftView = plainView
        txtUsername.leftViewMode = .always
        
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
        
        if txtPassword.text!.isEmpty || txtUsername.text!.isEmpty{
            HUD.flash(.label("Please enter your password"),delay: 1)
            return
        }else{
            txtUsername.text = txtUsername!.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            txtPassword.text = txtPassword!.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        if let elemnt = Constants.arrayUsers.first(where: {$0.username == txtUsername.text!}){
            if elemnt.password != txtPassword.text!{
                HUD.flash(.label("Password is incorrect, try again 🥺"),delay: 1)
            }else{
                HelperClass.currentUser = elemnt
                HUD.show(.progress)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBar = storyboard.instantiateViewController(withIdentifier: "Kredit-Tabbar")
                self.navigationController?.pushViewController(tabBar, animated: true)
            }
        }else{
            HUD.flash(.label("User does not exist 😔"),delay: 1)
        }
        
        
        //HUD.hide()
    }
    
}
