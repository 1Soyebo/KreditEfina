//
//  HelprClass.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit

class  HelperClass {
    static var currentUser:UserCredentials? = Constants.arrayUsers[0]
    static var signUUSer:UserType?
    static let sandBoxKey = "df2ada6175b75a5190191de5a04b1bf6"
    static let baseURL = "https://sandboxapi.fsi.ng"
    static func curveUiElements(views:UIView...){
        for singleView in views{
            singleView.layer.cornerRadius = 5
        }
    }
    
    static var someLoans:[Loan] = [.init(loanAmount: "$200", loanType: "Agricultural", duration: "30 days", intrestRate: "12%", summary: "I own a beet root farm", username: "Dwight Schrute", isRequested: true),.init(loanAmount: "$3000", loanType: "Business Loan", duration: "6 Months", intrestRate: "30%", summary: "I run a paper selling company", username: "Micheal Scott", isRequested: true), .init(loanAmount: "$4000", loanType: "Business Loan", duration: "6 months", intrestRate: "29%", summary: "This loan is for fashion inclined businesses", username: "Selena Meyer", isRequested: false),.init(loanAmount: "$2000", loanType: "Research Loan", duration: "2 years", intrestRate: "5%", summary: "This is loan is for people who wish to carry out research", username: "Tony Stark", isRequested: false), .init(loanAmount: "$2", loanType: "Businees Loan", duration: "14 days", intrestRate: "13%", summary: "This loan is for you Nigerian Students", username: "Ministry of Agriculture", isRequested: false)]
}

