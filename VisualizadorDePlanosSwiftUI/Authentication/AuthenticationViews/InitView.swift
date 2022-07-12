//
//  ContentView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 07/07/2022.
//

import SwiftUI

struct InitView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheet: SheetNames?
    
    var body: some View {
        VStack {
            Section {
            Image("Logo MyL")
                .resizable()
                .scaledToFit()
            Image("Gato2")
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            VStack {
                Button ("Login"){
                    authenticationSheet = .loginView
                }
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            HStack {
                Text("No tienes cuenta?")
                Button("Registrate"){
                    authenticationSheet = .registerView
                }
            }
        }
        .sheet(item: $authenticationSheet) { sheet in
            switch sheet {
            case .loginView:
                LoginView(authenticationViewModel: authenticationViewModel)
            case .registerView:
                RegisterView(authenticationViewModel:authenticationViewModel)
            }
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView(authenticationViewModel: AuthenticationViewModel())
    }
}
