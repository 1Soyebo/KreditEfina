//
//  OTPViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit
import SVPinView
import PKHUD

class OTPViewController: UIViewController {

    @IBOutlet weak var btnVirifyandContinue: UIButton!
    @IBOutlet weak var otpView: SVPinView!
    override func viewDidLoad() {
        super.viewDidLoad()
        HelperClass.curveUiElements(views: btnVirifyandContinue)
        configureOTP()
        // Do any additional setup after loading the view.
    }

    fileprivate func configureOTP(){
        otpView.style = .box
        otpView.fieldCornerRadius = 10
        otpView.activeFieldBackgroundColor = Constants.kreditLightBlue
        otpView.fieldBackgroundColor = Constants.kreditDarkBlue.withAlphaComponent(0.5)
        otpView.textColor = UIColor.white
        otpView.borderLineThickness = 1
        otpView.borderLineColor = UIColor.white
        otpView.activeBorderLineColor = UIColor.white
        otpView.interSpace = 10
        otpView.activeBorderLineThickness = 3
        otpView.activeFieldCornerRadius = 10
        otpView.shouldSecureText = false
    }

    
    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleVerifyAndContinue(_ sender: Any) {
        
        let hmm = otpView.getPin()
        if hmm.count != 4{
            HUD.flash(.label("Fill All Fields 🙏🏽"),delay: 1)
            return
        }
        
        if hmm != "0000" {
            HUD.flash(.label("Wrong OTP 🚫"),delay: 1)
        }else{
            let createTempUSer = UserCredentials(username: "userTEMP", password: "0000", usertype: HelperClass.signUUSer ?? .Borrower)
            HelperClass.currentUser = createTempUSer
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBar = storyboard.instantiateViewController(withIdentifier: "Kredit-Tabbar")
            
            self.navigationController?.pushViewController(tabBar, animated: true)
        }
        
        
    }
    

    
}
