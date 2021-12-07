//
//  HelperClass.swift
//  MyMVVMEXP
//
//  Created by Abhik Das on 07/12/21.
//

import Foundation
extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: self)
    }
    public var length:Int{
        self.count
    }
}
