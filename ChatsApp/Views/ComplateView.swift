//
//  ComplateView.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import SwiftUI

struct ComplateView: View {

    @State var animate: Bool = false
    @EnvironmentObject var viewModel : RegisterViewModel

    
    var body: some View {
        VStack{
            Spacer()
            Image("w4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            Text("Complate the Sign Up!")
                .font(.title)
                .foregroundStyle(Color("primaryGreen"))
                .bold()
            Text("You are now ready, you can now log in to the application.")
                .multilineTextAlignment(.center)
                .padding(.bottom , 40)
            
            VStack{
                Button {
                    viewModel.getget()
                } label: {
                    Text("COMPLATE 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("primaryGreen") : Color("darkGray"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal , animate ? 30 : 50)
                .shadow(color: animate ? Color("primaryGreen").opacity(0.7) : Color("darkGray").opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .onAppear(perform:addAnimation)
            Spacer()
        }
        
    }
    
    func addAnimation(){
        
        guard !animate else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    ComplateView()
        .environmentObject(RegisterViewModel())
}
