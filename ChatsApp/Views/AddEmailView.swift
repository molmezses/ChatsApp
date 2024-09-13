//
//  AddEmailView.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import SwiftUI

struct AddEmailView: View {
    
    @EnvironmentObject var viewModel : RegisterViewModel
    @FocusState var focusedField : FocusedField?
    
    @State var pre = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("w3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                Text("Add your Email")
                    .font(.title)
                    .foregroundStyle(Color("primaryGreen"))
                    .bold()
                Text("You need to define an \n email address for your account.")
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
                }
                
                NavigationLink {
                    AddPasswordView()
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
                .disabled(viewModel.isDisableEmail())
                .opacity(viewModel.isDisableEmail() ? 0.5 : 1)

                Spacer()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorEmailMessage), dismissButton: .default(Text("Ok")))
            }
            .navigationDestination(isPresented: $pre) {
                AddPasswordView()
            }
        }
    }
}

#Preview {
    AddEmailView()
        .environmentObject(RegisterViewModel())
}
