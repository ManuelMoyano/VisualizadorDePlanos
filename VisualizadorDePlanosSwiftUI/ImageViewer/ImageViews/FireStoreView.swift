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
            List (planosViewModel.planos, id: \.id) { plano in
                NavigationLink{
                    FireStoreImageView(codigo: plano.codigo, ubicacion: plano.url)
                } label: {
                    Text ("\(plano.codigo)")
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
                        Image("Logo MyL")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 20)
                        .cornerRadius(10)
                        .clipped()
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
        }
    }
}

struct FireStoreView_Previews: PreviewProvider {
    static var previews: some View {
        FireStoreView(authenticationViewModel: AuthenticationViewModel())
    }
}
