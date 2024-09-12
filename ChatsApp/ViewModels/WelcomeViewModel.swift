//
//  WelcomeViewModel.swift
//  ChatsApp
//
//  Created by Mustafa Ölmezses on 11.09.2024.
//

import Foundation

enum ViewStack{
    case login
    case register
}

class WelcomeViewModel: ObservableObject {
    @Published var presentNextView = false
    @Published var newView = ViewStack.login
}
