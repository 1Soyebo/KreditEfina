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
    static var psychQuestions:[PsychQuestions] = [.init(question: "I am a leader in most of my groups", number: 0), .init(question: "Presentations are difficult for me?", number: 1), .init(question: "I worry others will fnd out about my weakness?", number: 2),.init(question: "There are things in my past I wish I could change.", number: 3), .init(question: "Its Hard to act naturally with strangers.", number: 4), .init(question: "I only trust those I know well", number: 5),.init(question: "I rarely live up to my own standards.", number: 6)]
    
}


extension UIColor{
    static let kreditDarkRed = UIColor(hexString: "E63946")
    static let kreditDarkGreen = UIColor(hexString: "2D993E")
}
