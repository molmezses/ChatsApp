//
//  LoginView.swift
//  ChatApp
//
//  Created by Mustafa Ölmezses on 10.09.2024.
//

import SwiftUI

enum FocusedField{
    case email
    case password
}

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""

    @FocusState private var focusedField: FocusedField?

    var body: some View {
        VStack{
            Text("Login Here")
                .font(.title)
                .foregroundStyle(Color("primaryGreen"))
                .bold()
            Text("Welcome back you've \n been missed")
                .multilineTextAlignment(.center)
            
            VStack{
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .focused($focusedField , equals: .email)
                    .padding()
                    .background(Color("secondaryGreen").opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(focusedField == .email ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                
                SecureFieldWithButton(title: "Password", text: $password)
  
                
                HStack{
                    Spacer()
                    Text("Forgot password?")
                        .font(.footnote)
                        .foregroundStyle(Color("primaryGreen"))
                }
                .padding(.horizontal)
                
                Button(action: {}, label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("primaryGreen"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                })
                .padding(.vertical)
                .shadow(radius: 8)
                
                Text("Create new Account!")
                    .padding()
                Text("Or continue with")
                    .font(.footnote)
                    .foregroundStyle(Color("primaryGreen"))
                
                HStack{
                    Button(action: {}, label: {
                        Image("google-logo")
                    })
                    .iconButtonStyle
                    Button(action: {}, label: {
                        Image("facebook-logo")
                    })
                    .iconButtonStyle
                    Button(action: {}, label: {
                        Image("apple-logo")
                    })
                    .iconButtonStyle
                }
                .padding(.vertical)
            }
        }
    }
}

extension View{
    var iconButtonStyle: some View{
        self
            .padding()
            .background(Color("secondaryGray"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


#Preview {
    LoginView()
}
