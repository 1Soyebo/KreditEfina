//
//  AddNewCardViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PanModal
import PKHUD

class AddNewCardViewController: UIViewController {

    @IBOutlet weak var txtCardNumber: AddCardTextField!
    @IBOutlet weak var txtCvv: AddCardTextField!
    @IBOutlet weak var txtExpiry: AddCardTextField!
    @IBOutlet weak var txtPin: AddCardTextField!
    @IBOutlet weak var btnAddCard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddCard.layer.cornerRadius = 5
        
    }

    @IBAction func handleAddCard(_ sender: Any) {
        HUD.show(.progress)
        if !(txtCardNumber.text!.isEmpty || txtCvv.text!.isEmpty || txtPin.text!.isEmpty || txtExpiry.text!.isEmpty){
            let singleCard = CardDetails(cardNumer: txtCardNumber.text!, CVV: txtCvv.text!, pin: txtPin.text!, dateOFExpiry: txtExpiry.text!)
            HelperClass.currentUser?.userCardDets?.append(singleCard)
            if (HelperClass.currentUser?.userCardDets?.append(singleCard)) == nil {
                HelperClass.currentUser?.userCardDets = [singleCard]
            }
            dismiss(animated: true, completion: { HUD.hide()})
            
        }else{
            HUD.flash(.label("Fill All Fields 🙏🏽"))
        }
    }
    
}


extension AddNewCardViewController: PanModalPresentable{
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
