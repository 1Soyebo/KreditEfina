//
//  Constants.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit

class Constants{
    static let kreditLightBlue = UIColor(hexString: "00587A")
    static let kreditDarkBlue = UIColor(hexString: "0F3057")
    static let kreditVeryLightBlue = UIColor(hexString: "E8FFFF")
    static let kreditlightGrey = UIColor(hexString: "06492C")
    static let arrayUsers: [UserCredentials] = [.init(username: "Ciroma", password: "000000", usertype: .Borrower),.init(username: "Maria", password: "123456", usertype: .Lender)]
    
}


extension UIColor{
    static let kreditDarkRed = UIColor(hexString: "E63946")
    static let kreditDarkGreen = UIColor(hexString: "2D993E")
}
