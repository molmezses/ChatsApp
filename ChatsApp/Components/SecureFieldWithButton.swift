//
//  SecureFieldWithButton.swift
//  ChatApp
//
//  Created by Mustafa Ölmezses on 10.09.2024.
//

import SwiftUI




struct SecureFieldWithButton: View {
    
    @Binding private var text: String
    @State private var isSecured : Bool = false
    private var title : String
    
    @FocusState private var focusedField: FocusedField?

    
    init(title: String , text : Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment:.trailing){
            Group{
                if isSecured {
                    SecureField(title, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color("secondaryGreen").opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(focusedField == .email ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                        .focused($focusedField , equals: .email)
 
                        
                }else{
                    TextField(title, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color("secondaryGreen").opacity(0.05))
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
            Button{
                isSecured.toggle()
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
        SecureFieldWithButton(title: "Password", text: .constant(""))
    }


/*
 .background(
     RoundedRectangle(cornerRadius: 12)
         .stroke(focusedField == .password ? Color("primaryGreen") : Color("focused") , lineWidth: 3)
 )
 .padding(.horizontal)
 .padding(.bottom)
 
 */
