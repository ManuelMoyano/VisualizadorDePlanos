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
            LogoView()
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
            .toolbar {
                ToolbarItem (placement: .principal) {
                    HStack {
                        Button ("Logout"){
                            authenticationViewModel.logOut()
                        }
                        .frame(height: 30)
                        .foregroundColor(.white)
                        .background(Color.orange.opacity(0.7))
                        .cornerRadius(15)
                        Spacer()
                        Button ("List Files"){
                            Task {
                                planosViewModel.getAllPlanos()
                            }
                        }
                        .frame(height: 30)
                        .foregroundColor(.white)
                        .background(Color.orange.opacity(0.7))
                        .cornerRadius(15)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}

struct FireStoreView_Previews: PreviewProvider {
    static var previews: some View {
        FireStoreView(authenticationViewModel: AuthenticationViewModel())
    }
}
