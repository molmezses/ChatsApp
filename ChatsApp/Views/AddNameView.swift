//
//  AddNameView.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import SwiftUI

struct AddNameView: View {
    
    @FocusState private var focusedField: FocusedField?
    @EnvironmentObject var viewModel : RegisterViewModel

    var body: some View {
        NavigationStack{
            VStack{
                Image("w1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                Text("Add your name")
                    .font(.title)
                    .foregroundStyle(Color("primaryGreen"))
                    .bold()
                Text("What name would you like \n them to call you?")
                    .multilineTextAlignment(.center)
                    .padding(.bottom , 40)
                
                VStack{
                    TextField("Your name", text: $viewModel.name)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($focusedField , equals: .name)
                        .padding()
                        .background(Color("secondaryGreen").opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(focusedField == .name ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                    TextField("Surname", text: $viewModel.surName)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($focusedField , equals: .surName)
                        .padding()
                        .background(Color("secondaryGreen").opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(focusedField == .surName ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                
                NavigationLink {
                    AddEmailView()
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
                .disabled(viewModel.isDisableNameSurname())
                .opacity(viewModel.isDisableNameSurname() ? 0.5 : 1)
         
                Spacer()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.emptyMessage), dismissButton: .default(Text("Ok")))
            }
            .navigationDestination(isPresented: $viewModel.presentNextView) {
                AddEmailView()
            }
            
        }
    }
}

#Preview {
    AddNameView()
        .environmentObject(RegisterViewModel())
}
