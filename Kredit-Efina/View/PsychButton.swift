//
//  PsychButton.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import UIKit

class PsychButton: UIButton {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup(){
        self.layer.borderWidth = 1
        self.layer.borderColor = Constants.kreditDarkBlue.cgColor
        self.layer.cornerRadius = 5
        
    }
}
