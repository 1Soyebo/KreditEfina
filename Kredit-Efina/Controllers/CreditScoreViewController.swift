//
//  CreditScoreViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit

class CreditScoreViewController: UIViewController {

    @IBOutlet weak var btnPsychTest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        HelperClass.curveUiElements(views: btnPsychTest)
        // Do any additional setup after loading the view.
    }


    
    @IBAction func goToPsychTest(_ sender: Any) {
        let psychVc = PyschometryTestViewController(nibName: "PyschometryTestViewController", bundle: nil)
        self.navigationController?.pushViewController(psychVc, animated: true)
    }
    
}
