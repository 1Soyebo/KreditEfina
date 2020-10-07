//
//  HelprClass.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit

class  HelperClass {
    static func curveUiElements(views:UIView...){
        for singleView in views{
            singleView.layer.cornerRadius = 5
        }
    }
}

