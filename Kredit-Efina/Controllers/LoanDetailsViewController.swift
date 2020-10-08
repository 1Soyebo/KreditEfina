//
//  LoanDetailsViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import UIKit
import PanModal

class LoanDetailsViewController: UIViewController {

   
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
    }


    fileprivate func configureGreyView(views: UIView...){
        for myView in views{
            myView.backgroundColor = UIColor(hexString: "9E9E9E").withAlphaComponent(0.15)
            myView.layer.cornerRadius = 5
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
