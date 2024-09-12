//
//  RegisterViewModel.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import Foundation

class RegisterViewModel: ObservableObject{
    @Published var name = ""
    @Published var surName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var showAlert = false
    @Published var errorPasswordMessage = "Longer than 8 characters and contains uppercase letters."
    @Published var emptyMessage = "Please make sure all fields are filled in"
    @Published var errorEmailMessage = "Your Email is not a valid"
    @Published var presentNextView = false

    

    
    func isValidEmail() -> Bool {
        return Validator.validateEmail(email)
    }
    
    func isEmptyEmail() -> Bool {
        return email == ""
    }
    
    func isValidPassword() -> Bool {
        return Validator.validatePassword(password)
    }

    func isEmptyPassword() -> Bool {
        return password == ""
    }
    
    func isEmptyName() -> Bool {
        return name == ""
    }
    
    func isEmptySurName() -> Bool {
        return surName == ""
    }
    
    func getget() {
        print("\(name)")
        print("\(surName)")
        print("\(email)")
        print("\(password)")
    }
    
     func isDisableNameSurname() -> Bool{
         if isEmptyName(){
             return true
         }
         if isEmptySurName() {
             return true
         }
         return false
    }
    
    func isDisableEmail() -> Bool{
        if isEmptyName() {
            return true
        }
        if !isValidEmail() {
            return true
        }
        return false
    }
    
    func isDisablePassword() -> Bool{
        if isEmptyPassword() {
            return true
        }
        if !isValidPassword() {
            return true
        }
        return false
    }
    
}








