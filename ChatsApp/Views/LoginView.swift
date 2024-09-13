//
//  LoginView.swift
//  ChatApp
//
//  Created by Mustafa Ölmezses on 10.09.2024.
//

import SwiftUI



struct LoginView: View {
    

    @FocusState private var focusedField: FocusedField?
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    @State var isSecured = true
    
    var body: some View {
        VStack{
            Text("Login Here")
                .font(.title)
                .foregroundStyle(Color("primaryGreen"))
                .bold()
            Text("Welcome back you've \n been missed")
                .multilineTextAlignment(.center)
                .padding(.bottom , 40)
            
            VStack{
                if !viewModel.isValidEmail() && !viewModel.isEmptyEmail(){
                    HStack {
                        Text(viewModel.errorEmailMessage)
                            .foregroundStyle(.red)
                        .font(.footnote)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                TextField("Email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .focused($focusedField , equals: .email)
                    .padding()
                    .background(Color("secondaryGreen").opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(!viewModel.isValidEmail() && !viewModel.isEmptyEmail() ? .red.opacity(0.6)  : focusedField == .email ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)

                
                if !viewModel.isValidPassword() && !viewModel.isEmptyPassword(){
                    HStack {
                        Text(viewModel.errorPasswordMessage)
                            .foregroundStyle(.red)
                        .font(.footnote)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                VStack{
                    ZStack{
                        if isSecured{
                            VStack{
                                SecureField("Password", text: $viewModel.password)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                    .padding()
                                    .background(Color("secondaryGreen").opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(!viewModel.isValidPassword() && !viewModel.isEmptyPassword() ? .red.opacity(0.6)  : focusedField == .password ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
                                    )
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                    .focused($focusedField , equals: .password)
                            }
                        }else{
                            VStack{
                                TextField("Password", text: $viewModel.password)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                    .padding()
                                    .background(Color("secondaryGreen").opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(!viewModel.isValidPassword() && !viewModel.isEmptyPassword() ? .red.opacity(0.6)  : focusedField == .password ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
                                    )
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                    .focused($focusedField , equals: .password)
                            }
                        }
                        HStack{
                            Spacer()
                            Button(action: {
                                isSecured.toggle()
                            }, label: {
                                Image(systemName: isSecured ? "eye.slash" : "eye")
                                    .imageScale(.large)
                                    .foregroundStyle(.gray)
                                    .padding(.bottom)
                            })
                        }
                        .padding(.trailing , 36)
                        
                    }
                }
  
                
                HStack{
                    Spacer()
                    Text("Forgot password?")
                        .font(.footnote)
                        .foregroundStyle(Color("primaryGreen"))
                }
                .padding(.horizontal)
                
                Button(action: {
                    print("Mustafa \(viewModel.password) ")
                    viewModel.alertMessage()
                }, label: {
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
                    Button(action: {print("Mustafa \(viewModel.password) ")}, label: {
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
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Ok")))
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
