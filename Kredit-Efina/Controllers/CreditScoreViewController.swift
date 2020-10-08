//
//  CreditScoreViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit

class CreditScoreViewController: UIViewController {

    @IBOutlet weak var lblVerdict: UILabel!
    @IBOutlet weak var lblCreditNumber: UILabel!
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var progressBArView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HelperClass.curveUiElements(views: viewMain)
        configurePRogreeBarandVerdit()
        // Do any additional setup after loading the view.
    }

    func configurePRogreeBarandVerdit(){
        
        if let creditScore =  HelperClass.currentUser?.creditScore{
            progressBArView.setProgress((Float(creditScore)) / 850 , animated: true)
            lblCreditNumber.text = "\(creditScore)"
            switch creditScore {
            case 350...550:
                lblVerdict.text = "You may be limited to small loans"
                progressBArView.progressTintColor = .systemPink
            case 550...750:
                lblVerdict.text = "Good Score"
                progressBArView.progressTintColor = .yellow
            case 750...850:
                lblVerdict.text = "Great Score"
                progressBArView.progressTintColor = .green
            default:
                lblVerdict.text = "Good Score"
            }

        }else{
            progressBArView.isHidden = true
            lblVerdict.text = "Credit Score "
            lblCreditNumber.text = "Take Test"
        }
//        if HelperClass.currentUser!.creditScore == nil{
//        }else{
//        }
    }

    
    @IBAction func goToPsychTest(_ sender: Any) {
        if HelperClass.currentUser!.creditScore != nil{
            return
        }
        let creditTestVc = CreditScoreTestViewController(nibName: "CreditScoreTestViewController", bundle: nil)
        self.navigationController?.pushViewController(creditTestVc, animated: true)
    }
    
    
    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
