//
//  ViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnSingIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //curveUiElements(views: btnSignUp,btnSingIn)
        btnSignUp.layer.borderWidth = 1
        btnSignUp.layer.borderColor = Constants.kreditLightBlue.cgColor
    }
    

}

