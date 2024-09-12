//
//  SecureFieldWithButton.swift
//  ChatApp
//
//  Created by Mustafa Ölmezses on 10.09.2024.
//

import SwiftUI




struct LoginSecureFieldWithButton: View {
    
    @Binding private var text: String
    @State private var isSecured : Bool = true
    private var title : String
    
    @FocusState private var focusedField: FocusedField?
    @StateObject var viewModel = LoginViewModel()

    
    init() {
       
    }
    

    
    var body: some View {
        ZStack(alignment:.trailing){
            Group{
                if isSecured {
                    VStack{
                        if !viewModel.isValidPassword() && !viewModel.isEmptyPassword(){
                            HStack {
                                Text(viewModel.errorPasswordMessage)
                                    .foregroundStyle(.red)
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        SecureField(title, text: $viewModel.password)
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
                        if !viewModel.isValidPassword() && !viewModel.isEmptyPassword(){
                            HStack {
                                Text(viewModel.errorPasswordMessage)
                                    .foregroundStyle(.red)
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        TextField(title, text: $viewModel.password)
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
            }
            Button{
                isSecured.toggle()
                print("deneme \(viewModel.password)")
            }label: {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .tint(.gray)
                    .imageScale(.large)
            }
            .padding(.trailing , 36)
            .padding(.bottom , 16)
        }
    }
}


    #Preview {
        LoginSecureFieldWithButton(title: "Password", text: .constant(""))
    }



