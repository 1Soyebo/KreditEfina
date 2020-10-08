//
//  PsychTextField.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit

class PsychTextField: UITextField {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup(){
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(hexString: "9E9E9E").withAlphaComponent(0.25)
        let myleftView = UIView(frame: .init(x: 0, y: 0, width: 20, height: 20))
        self.leftView = myleftView
        self.leftViewMode = .always
        
    }

}

class AddCardTextField: UITextField {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup(){
        self.layer.cornerRadius = 5
        self.layer.borderColor = Constants.kreditlightGrey.withAlphaComponent(0.6).cgColor
        self.layer.borderWidth = 1
        let myleftView = UIView(frame: .init(x: 0, y: 0, width: 20, height: 20))
        self.leftView = myleftView
        self.leftViewMode = .always
        
    }

}
