//
//  FirebaseView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 12/07/2022.
//

import SwiftUI

struct FireStoreView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var planosViewModel: PlanosViewModel = PlanosViewModel()

    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Button ("Logout"){
                        authenticationViewModel.logOut()
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    Spacer()
                    Button ("List Files"){
                        Task {
                            planosViewModel.getAllPlanos()
                        }
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                }
            Image("Logo MyL")
            .resizable()
            .frame(width: 400
                   , height: 200, alignment: .center)
            .border(.white)
            .cornerRadius(200)
            Text("Usuario: \(authenticationViewModel.user?.email ?? "No user")")
            Section{
            List (planosViewModel.planos, id: \.id) { plano in
                NavigationLink{
                    FireStoreImageView(codigo: plano.codigo, ubicacion: plano.url)
                } label: {
                    HStack{
                        Image(systemName: "arrow.right.doc.on.clipboard")
                        Text ("\(plano.codigo)")
                    }
                }
            }
            }
            .navigationBarHidden(true)
            }
        }
    }
}

struct FireStoreView_Previews: PreviewProvider {
    static var previews: some View {
        FireStoreView(authenticationViewModel: AuthenticationViewModel())
    }
}
