//
//  CreditScoreViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit

class CreditScoreViewController: UIViewController {

    @IBOutlet weak var btnPsychTest: UIButton!
    @IBOutlet weak var viewMain: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        HelperClass.curveUiElements(views: btnPsychTest,viewMain)
        // Do any additional setup after loading the view.
    }


    
    @IBAction func goToPsychTest(_ sender: Any) {
        let creditTestVc = CreditScoreTestViewController(nibName: "CreditScoreTestViewController", bundle: nil)
        self.navigationController?.pushViewController(creditTestVc, animated: true)
    }
    
    
    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
