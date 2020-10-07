//
//  PreferredLanguageViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit
import DropDown

class PreferredLanguageViewController: UIViewController {

    @IBOutlet weak var viewLanguageBottom: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnLanguage: UIButton!
    let mylanguageDropdpwn = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCatgoryDropdown()

        
    }
    
    func configureCatgoryDropdown(){
        mylanguageDropdpwn.anchorView = viewLanguageBottom
        mylanguageDropdpwn.direction = .bottom
        mylanguageDropdpwn.dataSource = ["English","Yoruba","Hausa","Igbo"]
        mylanguageDropdpwn.selectionBackgroundColor = Constants.kreditDarkBlue.withAlphaComponent(0.5)
        mylanguageDropdpwn.backgroundColor = Constants.kreditLightBlue
        mylanguageDropdpwn.textColor = UIColor.white
        mylanguageDropdpwn.selectedTextColor = UIColor.white
    }

    
    @IBAction func handlelanguageDropDown(_ sender: Any) {
        mylanguageDropdpwn.show()
    }
    
    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToDescribeVC(_ sender: Any) {
        let describeVC = DescribeViewController(nibName: "DescribeViewController", bundle: nil)
        self.navigationController?.pushViewController(describeVC, animated: true)
    }
    
}
