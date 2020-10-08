//
//  SearchLoansViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PanModal
import PKHUD

class SearchLoansViewController: UIViewController {
    
    //MARK:PickerView
    var purposepicker: UIPickerView!
    var interestRatePicker:UIPickerView!
    var paybackTimePicker:UIPickerView!
    
    //MARK:Datasource
    let array_purpose = ["Agriculrure Loan", "Sales Loan", "Education Loan", "Business Loan"]
    let array_interest = ["2-5%", "5-10%", "15-20%", "20-25%"," >25%"]
    let array_payback = ["14 days", "30 days", "2 months", "4 months", "6 months", "1 year"]
    
    //MARK:TEXTFIELDS
    @IBOutlet weak var txtPurposeLoan: UITextField!
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var txtInterestRate: UITextField!
    @IBOutlet weak var txtPaybackTime: UITextField!
    
    
    var viewTitle = ""
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewPurposeLoan: UIView!
    @IBOutlet weak var viewLoanAmount: UIView!
    @IBOutlet weak var viewMiniumumNitrestRate: UIView!
    @IBOutlet weak var viewMinimumPaybacktime: UIView!
    @IBOutlet weak var btnSearch: UIButton!
    var isCreateLoan:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSearch.layer.cornerRadius = 5
       configureGreyView(views: viewLoanAmount,viewPurposeLoan,viewMinimumPaybacktime,viewMiniumumNitrestRate)
        lblTitle.text = viewTitle
        setupPurpose()
        setupInterest()
        setupPayback()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isCreateLoan{
            btnSearch.setTitle("Create 🚀", for: .normal)
        }
    }

    fileprivate func configureGreyView(views: UIView...){
        for myView in views{
            myView.backgroundColor = UIColor(hexString: "9E9E9E").withAlphaComponent(0.15)
            myView.layer.cornerRadius = 5
        }
    }
    
    func setupPurpose(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        purposepicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        purposepicker.dataSource = self
        purposepicker.delegate = self
        purposepicker.tag = 0
        inputView.addSubview(purposepicker)
        txtPurposeLoan.inputView = inputView
    }
    
    func setupInterest(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        interestRatePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        interestRatePicker.dataSource = self
        interestRatePicker.delegate = self
        interestRatePicker.tag = 1
        inputView.addSubview(interestRatePicker)
        txtInterestRate.inputView = inputView
    }
    
    func setupPayback(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        paybackTimePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        paybackTimePicker.dataSource = self
        paybackTimePicker.delegate = self
        paybackTimePicker.tag = 2
        inputView.addSubview(paybackTimePicker)
        txtPaybackTime.inputView = inputView
    }
    
    @IBAction func handleSearch(){
        if isCreateLoan{
            if !(txtPurposeLoan.text!.isEmpty || txtInterestRate.text!.isEmpty || txtAmount.text!.isEmpty || txtPaybackTime.text!.isEmpty){
                //let singleLoan = Loan(loanAmount: txtAmount.text!, loanType: txtPurposeLoan.text!, duration: txtPaybackTime.text!, intrestRate: txtInterestRate.text!, summary: "\(txtPurposeLoan.text!) to be paid back by \(txtPaybackTime.text!) with \(txtInterestRate.text!) intrest")
                let singleLoan = Loan(loanAmount: txtAmount.text!, loanType: txtPurposeLoan.text!, duration: txtPaybackTime.text!, intrestRate: txtInterestRate.text!, summary: "\(txtPurposeLoan.text!) to be paid back by \(txtPaybackTime.text!) with \(txtInterestRate.text!) intrest", username: HelperClass.currentUser!.username, isRequested: (HelperClass.currentUser!.usertype == .Borrower))
                if (HelperClass.currentUser?.loanRequested?.append(singleLoan)) == nil{
                    HelperClass.currentUser?.loanRequested = [singleLoan]
                }
                HelperClass.someLoans.append(singleLoan)
                dismiss(animated: true, completion: nil)
            }else{
                HUD.flash(.label("Fill All Fields 🙏🏽"),delay: 1)
            }
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
    
}

extension SearchLoansViewController: PanModalPresentable{
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


extension SearchLoansViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag{
        case 0:
            return array_purpose.count
        case 1:
            return array_interest.count
        case 2:
            return array_payback.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 0:
            return array_purpose[row]
        case 1:
            return array_interest[row]
        case 2:
            return array_payback[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 0:
            txtPurposeLoan.text = array_purpose[row]
        case 1:
            txtInterestRate.text = array_interest[row]
        case 2:
            txtPaybackTime.text = array_payback[row]
        default:
            print("k")
        }
    }
}
