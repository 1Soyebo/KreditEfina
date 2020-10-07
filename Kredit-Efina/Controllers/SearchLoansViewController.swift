//
//  SearchLoansViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PanModal

class SearchLoansViewController: UIViewController {

    @IBOutlet weak var viewPurposeLoan: UIView!
    @IBOutlet weak var viewLoanAmount: UIView!
    @IBOutlet weak var viewMiniumumNitrestRate: UIView!
    @IBOutlet weak var viewMinimumPaybacktime: UIView!
    @IBOutlet weak var btnSearch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSearch.layer.cornerRadius = 5
       configureGreyView(views: viewLoanAmount,viewPurposeLoan,viewMinimumPaybacktime,viewMiniumumNitrestRate)
    }


    fileprivate func configureGreyView(views: UIView...){
        for myView in views{
            myView.backgroundColor = UIColor(hexString: "9E9E9E").withAlphaComponent(0.15)
            myView.layer.cornerRadius = 5
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
