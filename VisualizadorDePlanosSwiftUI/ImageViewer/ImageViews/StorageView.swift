//
//  HomeView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 08/07/2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct StorageView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var imageCode = ""
    @StateObject var storageManager = StorageManager()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Text("\(authenticationViewModel.user?.email ?? "No user")")
            Section {
                List (storageManager.codigos, id: \.id) {item in
                    VStack {
                        NavigationLink {
                            ImageView(ubicacion: item.codigo)
                        } label: {
                            Text("\(item.codigo)")
                        }
                    }
                }
            }
        }
            .navigationBarTitle("Vista de Planos")

//            .navigationBarTitleDisplayMode(.inline)
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
                                await storageManager.listItems()
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

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageView(authenticationViewModel: AuthenticationViewModel())
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
