//
//  String+Extensions.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 11/09/24.
//

import Foundation


extension CustomUITextField {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let text = self.text ?? ""

        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: text,  options: [], range: NSRange(location: 0, length: text.count)) != nil
    }
    
    func isValidPassword() -> Bool {
        let text = self.text?.count ?? 0
        if(text > 3){
            return true
        }
        return false
    }
}
