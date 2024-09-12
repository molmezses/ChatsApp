//
//  WelcomeView.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 10.09.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject var viewModel = WelcomeViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image("w2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Message your friends to socialize online")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("primaryGreen"))
                    .bold()
                    .padding(.bottom)
                    .padding(.bottom)
                Text("You are in the right place to socialize and message with your friends in a fun way.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                
                HStack{
                    Button(action: {
                        viewModel.presentNextView = true
                        viewModel.newView = .login
                    }, label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width: 160 , height: 60)
                            .background(Color("primaryGreen"))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    })
                    .shadow(radius: 6)

                    Button(action: {
                        viewModel.presentNextView = true
                        viewModel.newView = .register
                    }, label: {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .frame(width: 160 , height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    })

                }
                .padding(.top , 40)
                
                Spacer()
                
            }
            .navigationDestination(isPresented: $viewModel.presentNextView) {
                if viewModel.newView == .login{
                    LoginView()
                }else{
                    AddNameView()
                }
            }
        }
    }
}



#Preview {
    WelcomeView()
}

