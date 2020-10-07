//
//  CreateAccountViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var txtPhoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        HelperClass.curveUiElements(views: txtPhoneNumber)
        // Do any additional setup after loading the view.
    }


    @IBAction func handleBAck(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleOTPAccount(_ sender:Any){
        let otpView = OTPViewController(nibName: "OTPViewController", bundle: nil)
        self.navigationController?.pushViewController(otpView, animated: true)
    }

}
