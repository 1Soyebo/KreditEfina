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

struct UserCredentials:Equatable {
    let username:String
    let password:String
    let usertype:UserType
    
    static func == (lhs: Self, rhs: Self) -> Bool{
        return lhs.password == rhs.password
    }
}
