//
//  CreateAccountViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit
import PKHUD
import Alamofire


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
        if txtPhoneNumber.text!.isEmpty{
            HUD.flash(.label("Enter your phone number 📞"),delay: 1)
            return
        }
        sendTextMessage(phoneNumber: "8182929823"){
            status in
            if status{
                DispatchQueue.main.async {
                    HUD.flash(.label("A One-time-Password Has Been sent to \(self.txtPhoneNumber.text!)"),delay: 1)
                    let otpView = OTPViewController(nibName: "OTPViewController", bundle: nil)
                    self.navigationController?.pushViewController(otpView, animated: true)
                }
            }
        }
        
    }

    fileprivate func sendTextMessage(phoneNumber:String, completionHandler: @escaping (Bool) -> Void){
        Connectivity.isConnectedToInternet(viewcontroller: self)
        let sendSMSEdnpoint = "/atlabs/messaging"
        let sendSMSBody:Parameters = ["to":"+2348182929823", "from":"FSI","message":"Hello World"]
        let sendSMSHeaders:HTTPHeaders = ["Sandbox-Key":HelperClass.sandBoxKey]
        HUD.show(.progress)
        AF.request(HelperClass.baseURL + sendSMSEdnpoint, method: .post, parameters: sendSMSBody, headers: sendSMSHeaders)
            .responseJSON{
            response in
            switch response.result{
            case .success:
                guard response.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling POST on /todos/1")
                    print(response.error!)
                    HUD.flash(.labeledError(title: "Network Error", subtitle: "Check internet Connection"),delay: 1)
                    return
                }
                // make sure we got some JSON since that's what we expect
                guard let json = response.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                HUD.hide()
                print(json)

                let SMSMessageData = json["SMSMessageData"] as? [String:Any]
                let Recipients = SMSMessageData?["Recipients"] as! NSArray
                for recep in Recipients{
                    let recepk = recep as? [String:Any]
                    let status = recepk?["status"] as? String
                    if status == "Success"{
                        completionHandler(true)
                    }else{
                        completionHandler(false)
                    }
                }
                
                
            case .failure:
                print("k")
            }
        }
    }
}
