//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Mustafa Ölmezses on 10.09.2024.
//

import Foundation

enum FocusedField{
    case email
    case password
    case name
    case surName
}




class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    
    @Published var errorEmailMessage = "Your Email is not a valid"
    @Published var errorPasswordMessage = "Longer than 8 characters and contains uppercase letters."
    @Published var errorNilEmailMessage = "Please enter an email address"
    @Published var errorNilPasswordMessage = "Please enter a  password"
    
    @Published var showAlert: Bool = false
    @Published var errorMessage = ""
    
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
    
    func alertMessage(){
        guard !isEmptyEmail() else {
            errorMessage = errorNilEmailMessage
            showAlert = true
            return
        }
        guard isValidEmail() else {
            errorMessage = errorEmailMessage
            showAlert = true
            return
        }
        guard !isEmptyPassword() else {
            errorMessage = "Please enter a  password"
            showAlert = true
            return
        }

        guard isValidPassword() else {
            errorMessage = "Longer than 8 characters and contains uppercase letters."
            showAlert = true
            return
        }

        
        showAlert = false
        return
    }
    

  
    
}
