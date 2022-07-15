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
    @StateObject var storageManager = StorageManager()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                LogoView()
                Text("Usuario: \(authenticationViewModel.user?.email ?? "No user")")
            Section {
                List (storageManager.codigos, id: \.id) {item in
                    VStack {
                        NavigationLink {
                            StorageImageView(ubicacion: item.codigo)
                        } label: {
                            HStack{
                                Image(systemName: "arrow.right.doc.on.clipboard")
                                Text("\(item.codigo)")
                            }
                        }
                    }
                }
            }
        }.toolbar {
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
         .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageView(authenticationViewModel: AuthenticationViewModel())
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
