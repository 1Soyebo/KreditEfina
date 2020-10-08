//
//  PyschometryTestViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PKHUD

class CreditScoreTestViewController: UIViewController {

    //MARK: PICKERS
    var yesNopicker: UIPickerView!
    var maritalStatusPicker:UIPickerView!
    var locationPicker:UIPickerView!
    var stateOFOriginPicker:UIPickerView!
    var numberPicker:UIPickerView!
    var noRechargePicker:UIPickerView!
    var lenghtBusinessPicker:UIPickerView!
    var typeOfBusinessPicker:UIPickerView!

    var pickerDateOfBirth:UIDatePicker = UIDatePicker()

    
    
    //MARK:PICKER DATA
    let array_yes_no = ["Yes","No"]
    let array_marital_status = ["Married","Single","Divorced"]
    let array_location = ["Mushin","Ikorodu","Costain"]
    let array_state_of_origin = ["Ogun","Lagos","Cross River"]
    let array_number = ["One (1)","Two (2)", "Three (3)", "Four (4)"]
    let array_recharge = ["1-2 times","3-4 times","5-6 times"]
    let array_years_business = ["Less than 6 months","Over 6 months","1-2 years","3-5 years","Over 5 years"]
    let array_type_business = ["Agriculture", "Education", "Sales", "Business"]
    
    @IBOutlet weak var txtStateOrigin: PsychTextField!
    @IBOutlet weak var txtDateOfBIrth: PsychTextField!
    @IBOutlet weak var txtPhoneNumber: PsychTextField!
    @IBOutlet weak var txtMaritalStatus: PsychTextField!
    @IBOutlet weak var txtLocation: PsychTextField!
    @IBOutlet weak var txtTypeOfBusiness: PsychTextField!
    @IBOutlet weak var txtNoOfDependents: PsychTextField!
    @IBOutlet weak var txtBills: PsychTextField!
    @IBOutlet weak var txtNoCreditLoansTaken: PsychTextField!
    @IBOutlet weak var txtFrequentRecharge: PsychTextField!
    @IBOutlet weak var txtYearsBusiness: PsychTextField!
    @IBOutlet weak var txtCooperative: PsychTextField!
    @IBOutlet weak var txtFullname: PsychTextField!
    @IBOutlet weak var txtGurantorsPhoneNumber: PsychTextField!
    @IBOutlet weak var txtGuarantosPhone: PsychTextField!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnNext.layer.cornerRadius = 5
        setupBillss()
        setupLocation()
        setupPickerDateOfBirth()
        setupStateOfOrigin()
        setupMaritalStatus()
        setupNumber()
        setupLengthBusiness()
        setupTypeOFBusiness()
        setupRecharge()
        
    }

    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToPsycoTest(_ sender: Any) {
        if (txtStateOrigin.text!.isEmpty || txtDateOfBIrth.text!.isEmpty || txtPhoneNumber.text!.isEmpty || txtMaritalStatus.text!.isEmpty || txtLocation.text!.isEmpty || txtTypeOfBusiness.text!.isEmpty || txtNoOfDependents.text!.isEmpty || txtBills.text!.isEmpty || txtNoCreditLoansTaken.text!.isEmpty || txtFrequentRecharge.text!.isEmpty || txtYearsBusiness.text!.isEmpty || txtCooperative.text!.isEmpty || txtFullname.text!.isEmpty || txtGurantorsPhoneNumber.text!.isEmpty || txtGuarantosPhone.text!.isEmpty){
            HUD.flash(.label("Fill All Fields 🙏🏽"),delay: 1)
            return
        }
        let psychVc = PsychomtryViewController(nibName: "PsychomtryViewController", bundle: nil)
        self.navigationController?.pushViewController(psychVc, animated: true)
    }
    
    //MARK:FINANCIAL SETUP
    func setupBillss(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        yesNopicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        yesNopicker.dataSource = self
        yesNopicker.delegate = self
        yesNopicker.tag = 0
        inputView.addSubview(yesNopicker)
        txtBills.inputView = inputView
        txtCooperative.inputView = inputView
    }
    
    func setupMaritalStatus(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        maritalStatusPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        maritalStatusPicker.dataSource = self
        maritalStatusPicker.delegate = self
        maritalStatusPicker.tag = 1
        inputView.addSubview(maritalStatusPicker)
        txtMaritalStatus.inputView = inputView
    }
    
    func setupLocation(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        locationPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        locationPicker.dataSource = self
        locationPicker.delegate = self
        locationPicker.tag = 2
        inputView.addSubview(locationPicker)
        txtLocation.inputView = inputView
    }
    
    func setupStateOfOrigin(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        stateOFOriginPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        stateOFOriginPicker.dataSource = self
        stateOFOriginPicker.delegate = self
        stateOFOriginPicker.tag = 3
        inputView.addSubview(stateOFOriginPicker)
        txtStateOrigin.inputView = inputView
    }
    
    func setupTypeOFBusiness(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        typeOfBusinessPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        typeOfBusinessPicker.dataSource = self
        typeOfBusinessPicker.delegate = self
        typeOfBusinessPicker.tag = 7
        inputView.addSubview(typeOfBusinessPicker)
        txtTypeOfBusiness.inputView = inputView
    }
    
    func setupPickerDateOfBirth(){
        pickerDateOfBirth.datePickerMode = UIDatePicker.Mode.date
        pickerDateOfBirth.maximumDate = Date()
        txtDateOfBIrth.inputView = pickerDateOfBirth
        pickerDateOfBirth.addTarget(self, action: #selector(handleDatePicker(_:)), for: UIControl.Event.valueChanged)
    }

    
    
    @objc func handleDatePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        if txtDateOfBIrth.isEditing{
            txtDateOfBIrth.text = dateFormatter.string(from: sender.date)
        }
        //self.view.endEditing(true)
    }
    
    //MARK:FINANCIAL INFORMATION
    fileprivate func setupNumber(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        numberPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        numberPicker.dataSource = self
        numberPicker.delegate = self
        numberPicker.tag = 4
        inputView.addSubview(numberPicker)
        txtNoOfDependents.inputView = inputView
        txtNoCreditLoansTaken.inputView = inputView
    }
    
    fileprivate func setupRecharge(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        noRechargePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        noRechargePicker.dataSource = self
        noRechargePicker.delegate = self
        noRechargePicker.tag = 5
        inputView.addSubview(noRechargePicker)
        txtFrequentRecharge.inputView = inputView
    }
    
    fileprivate func setupLengthBusiness(){
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        lenghtBusinessPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
        lenghtBusinessPicker.dataSource = self
        lenghtBusinessPicker.delegate = self
        lenghtBusinessPicker.tag = 6
        inputView.addSubview(lenghtBusinessPicker)
        txtYearsBusiness.inputView = inputView
    }
    
}

extension CreditScoreTestViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 0:
            return array_yes_no.count
        case 1:
            return array_marital_status.count
        case 2:
            return array_location.count
        case 3:
            return array_state_of_origin.count
        case 4:
            return array_number.count
        case 5:
            return array_recharge.count
        case 6:
            return array_years_business.count
        case 7:
            return array_type_business.count
        default:
            print("impossible")
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 0:
            return array_yes_no[row]
        case 1:
            return array_marital_status[row]
        case 2:
            return array_location[row]
        case 3:
            return array_state_of_origin[row]
        case 4:
            return array_number[row]
        case 5:
            return array_recharge[row]
        case 6:
            return array_years_business[row]
        case 7:
            return array_type_business[row]
        default:
            print("impossible")
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 0:
            for txt in [txtBills, txtCooperative]{
                if txt!.isEditing{
                    txt?.text = array_yes_no[row]
                }
            }
        case 1:
            txtMaritalStatus.text = array_marital_status[row]
        case 2:
            txtLocation.text = array_location[row]
        case 3:
            txtStateOrigin.text = array_state_of_origin[row]
        case 4:
            for txt in [txtNoOfDependents,txtNoCreditLoansTaken]{
                if txt!.isEditing{
                    txt?.text = array_number[row]
                }
            }
        case 5:
            txtFrequentRecharge.text = array_recharge[row]
        case 6:
            txtYearsBusiness.text = array_years_business[row]
        case 7:
            txtTypeOfBusiness.text = array_type_business[row]
        default:
            print("impossible")
        }
        print("k")
    }
}
