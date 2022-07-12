//
//  RegisterView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 07/07/2022.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @State private var userEmailAdress = ""
    @State private var userPassword = ""
    
    var body: some View {
        VStack {
            Text("Login View")
                .padding(30)
            TextField("Email Adress", text: $userEmailAdress)
                .padding(.top,20)
            TextField("Password", text: $userPassword)
                .padding(.top,20)
            Spacer()
            Button ("Aceptar") {
                authenticationViewModel.creatNewUser(email: userEmailAdress, password: userPassword)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            Button ("Cerrar") {
                dismiss()
            }
            if let messageError = authenticationViewModel.messageError {
                Text (messageError)
                    .bold()
                    .font(.body)
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(authenticationViewModel: AuthenticationViewModel())
    }
}
