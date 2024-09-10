//
//  Validations.swift
//  LoginScreen
//
//  Created by Everton Carneiro on 23/09/23.
//

import Foundation



enum Validator {
    static func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    
        static func validatePassword(_ password: String) -> Bool {
            // Güncellenmiş regex deseni
            let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&^#()_+\\-=\\[\\]{}|;:',.<>?/]).{8,}$"
            
            // NSPredicate kullanarak regex ile karşılaştırma
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            return passwordPredicate.evaluate(with: password)
        }
    



}
