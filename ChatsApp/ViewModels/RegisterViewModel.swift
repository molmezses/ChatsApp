//
//  RegisterViewModel.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

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
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result , error in
            guard let userId = result?.user.uid else {return}
            if error == nil{
                print("BASARİLİ")
            }
            else{
                print("HATA")
            }
            //Insert metodu çağırılacak
            self.insertUserData(id: userId)
        }
    }
    
    func insertUserData(id : String) {
        let newUser = Users(id: id, firstName: name, LastName: surName, userEmail: email, password: password)
        let db = Firestore.firestore()
        db.collection("Users").document(id).setData(newUser.asDictonary())
    }
    
}








