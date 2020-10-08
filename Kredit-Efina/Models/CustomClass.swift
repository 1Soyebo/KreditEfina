//
//  CustomClass.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import Foundation

enum UserType {
    case Borrower, Lender
}

class UserCredentials:Equatable {
    internal init(username: String, password: String, usertype: UserType, creditScore: Int? = nil, loanRequested: [Loan]? = nil, userCardDets: [CardDetails]? = nil) {
        self.username = username
        self.password = password
        self.usertype = usertype
        self.creditScore = creditScore
        self.loanRequested = loanRequested
        self.userCardDets = userCardDets
    }
    
    let username:String
    let password:String
    let usertype:UserType
    var creditScore:Int? = nil
    var loanRequested:[Loan]? = nil
    var userCardDets:[CardDetails]? = nil
    
    static func == (lhs: UserCredentials, rhs: UserCredentials) -> Bool{
        return lhs.password == rhs.password
    }
}

struct PsychQuestions {
    let question:String
    let number:Int
    var answer:Bool? = nil
    
}


struct Loan {
    let loanAmount:String
    let loanType:String
    let duration:String
    let intrestRate:String
    let summary:String
    let username:String
    let isRequested:Bool
}


struct CardDetails {
    let cardNumer:String
    let CVV:String
    let pin:String
    let dateOFExpiry:String
}
