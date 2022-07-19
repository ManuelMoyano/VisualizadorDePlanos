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
    @State private var searchText = ""
    var searchResults: [PlanosDataModel] {
        if searchText.isEmpty {
            return planosViewModel.planos
        } else {
            return planosViewModel.planos.filter { $0.codigo.localizedCaseInsensitiveContains(searchText) }
        }
    }

    
    var body: some View {
        VStack {
            LogoView()
            HStack {
                Image (systemName: "person.circle")
                Text("\(authenticationViewModel.user?.email ?? "No user")")
            }
            NavigationView{
                VStack{

                Section{
                List (searchResults, id: \.id) { plano in
                    NavigationLink{
                        FireStoreImageView(codigo: plano.codigo, descripcion: plano.descripcion, ubicacion: plano.url)
                    } label: {
                        HStack{
                            Image(systemName: "arrow.right.doc.on.clipboard")
                            Text ("\(plano.codigo)")
                            Text ("\(plano.descripcion)")
                        }
                    }
                }
                .searchable(text: $searchText)
                }
                .toolbar {
                    ToolbarItem (placement: .principal) {
                        HStack {
//                            Button ("Logout"){
//                                authenticationViewModel.logOut()
//                            }
//                            .frame(height: 30)
//                            .foregroundColor(.white)
//                            .background(Color.orange.opacity(0.7))
//                            .cornerRadius(15)
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
                .navigationBarTitle("Vista FireStore", displayMode: .inline)
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
