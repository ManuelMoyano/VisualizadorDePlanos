//
//  SwiftUIView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 07/07/2022.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @State private var userEmailAdress = ""
    @State private var userPassword = ""
    
    
    var body: some View {
        VStack {
            Text("Login View")
                .padding(30)
            Group {
                TextField("Email Adress", text: $userEmailAdress)
                    .padding(.top,20)
                TextField("Password", text: $userPassword)
                    .padding(.top,20)
            }
            Spacer()
            Button ("Login"){
                authenticationViewModel.login(email: userEmailAdress, password: userPassword)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            if let messageError = authenticationViewModel.messageError {
                Text (messageError)
                    .bold()
                    .font(.body)
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
            
            
            Button ("Cerrar") {
                dismiss()
            }
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authenticationViewModel: AuthenticationViewModel())
    }
}
