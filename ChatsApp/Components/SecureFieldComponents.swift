//
//  SecureFieldComponents.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import SwiftUI

struct SecureFieldComponents: View {
    
    @FocusState private var focusedField: FocusedField?
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    @State var isSecured = false
    
    var body: some View {


        
    }
}

#Preview {
    SecureFieldComponents()
}
