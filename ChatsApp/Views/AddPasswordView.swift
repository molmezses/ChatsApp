//
//  AddPasswordView.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import SwiftUI

struct AddPasswordView: View {
    
    @EnvironmentObject var viewModel : RegisterViewModel
    @FocusState var focusedField : FocusedField?
    @State var isSecured = true
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("w5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                Text("Create your password")
                    .font(.title)
                    .foregroundStyle(Color("primaryGreen"))
                    .bold()
                Text("You need to create a password to ensure your security")
                    .multilineTextAlignment(.center)
                    .padding(.bottom , 40)
                
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
                                            .stroke(focusedField == .password ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
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
                
                NavigationLink {
                    ComplateView()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("primaryGreen"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                }
                .padding(.vertical)
                .shadow(radius: 8)
                .disabled(viewModel.isDisablePassword())
                .opacity(viewModel.isDisablePassword() ? 0.5 : 1)
                Spacer()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorPasswordMessage), dismissButton: .default(Text("Ok")))
            }
            .navigationDestination(isPresented: $viewModel.presentNextView) {
                ComplateView()
            }
        }
    }
}

#Preview {
    AddPasswordView()
        .environmentObject(RegisterViewModel())
}
