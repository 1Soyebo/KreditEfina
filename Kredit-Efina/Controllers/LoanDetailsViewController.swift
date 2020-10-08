//
//  LoanDetailsViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import UIKit
import PanModal
import Alamofire
import PKHUD

class LoanDetailsViewController: UIViewController {

   
    @IBOutlet weak var lblPurpose: UILabel!
    @IBOutlet weak var lblInterest: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblPayback: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    
    var purpose = ""
    var interest = ""
    var paybackTime = ""
    var amount = ""
    var subTitle = ""
    var isDisabled = false
    
    @IBOutlet weak var shadowCardView: UIView!
    @IBOutlet weak var btnApprove: UIButton!
    @IBOutlet weak var btnDecline: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        HelperClass.curveUiElements(views: shadowCardView,btnApprove,btnDecline)
        shadowCardView.layer.shadowColor = Constants.kreditlightGrey.withAlphaComponent(0.6)
            .cgColor
        shadowCardView.layer.shadowOpacity = 0.7
        shadowCardView.layer.shadowRadius = 2
        shadowCardView.layer.shadowOffset = .init(width: 2.0, height: 2.0)
        btnDecline.layer.borderWidth = 1
        btnDecline.layer.borderColor = Constants.kreditlightGrey.cgColor
        configureLoanDEtails()
        if HelperClass.currentUser!.usertype == .Borrower{
            btnDecline.isHidden = true
            btnApprove.setTitle("Apply for Loan 🚀", for: .normal)
        }
    }

    fileprivate func configureLoanDEtails(){
        if purpose == ""{
            return
        }
        lblInterest.text = interest
        lblAmount.text = amount
        lblPurpose.text = purpose
        lblPayback.text = purpose
        lblUsername.text = subTitle
        if isDisabled{
            btnApprove.isHidden = isDisabled
        }
    }
    
    fileprivate func configureGreyView(views: UIView...){
        for myView in views{
            myView.backgroundColor = UIColor(hexString: "9E9E9E").withAlphaComponent(0.15)
            myView.layer.cornerRadius = 5
        }
    }
    
    @IBAction func handleChat(_ sender: Any) {
        sendTextMessage(phoneNumber: "8182929823"){
            status in
            if status{
                DispatchQueue.main.async {
                    HUD.flash(.label("Message Has Been Sent to ..."))
                }
            }
        }
    }
    
    
    
    @IBAction func handleApproveLoan(_ sender: Any) {
        
        if btnApprove.titleLabel?.text == "Apply for Loan 🚀"{
            HUD.flash(.label("Your request has been sent to \(subTitle)"))
        }else{
            if HelperClass.currentUser?.userCardDets == nil{
                HUD.flash(.label("Please Add a Card 🙏🏽"),delay: 1)
                return
            }
            sendMoneyWithStering()
        }
        
    }
    
    fileprivate func sendMoneyWithStering(){
        Connectivity.isConnectedToInternet(viewcontroller: self)
        HUD.show(.progress)
        let endpoint = "/sterling/accountapi/api/Spay/InterbankTransferReq"
        let params:Parameters = ["Referenceid":"0101",
                                 "RequestType":"01",
                                 "Translocation":"0101",
                                 "SessionID":"01",
                                 "FromAccount":"01",
                                 "ToAccount":"01",
                                 "Amount":"01",
                                 "DestinationBankCode":"01",
                                 "NEResponse":"01",
                                 "BenefiName":"01",
                                 "PaymentReference":"01",
                                 "OriginatorAccountName":"01",
                                 "translocation":"01"]
        let myheader:HTTPHeaders = ["Sandbox-Key":"df2ada6175b75a5190191de5a04b1bf6",
                                    "Content-Type":"application/json",
                                    "Ocp-Apim-Subscription-Key":"t",
                                    "Ocp-Apim-Trace":"true",
                                    "Appid":"69",
                                    "ipval":"0"]
        AF.request(HelperClass.baseURL + endpoint, method: .post, parameters: params, headers: myheader)
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
                    HUD.flash(.label("💸 A Loan of \(self.amount) has been Apporoved by you 💸"),delay: 2)
                    self.dismiss(animated: true, completion: nil)
                    
                case .failure(let error):
                    HUD.flash(.label(error.localizedDescription),delay: 1)
                }
            }
    }
    
    @IBAction func handleDeclineLoan(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

extension LoanDetailsViewController: PanModalPresentable{
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
    
    var shortFormHeight: PanModalHeight{
        return .contentHeight(455)
    }
}
