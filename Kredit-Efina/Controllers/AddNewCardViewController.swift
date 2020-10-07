//
//  AddNewCardViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PanModal

class AddNewCardViewController: UIViewController {

    @IBOutlet weak var btnAddCard: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddCard.layer.cornerRadius = 5
        
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
