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
    var searchResults: [Plano] {
        if searchText.isEmpty {
            return storageManager.codigos
        } else {
            return storageManager.codigos.filter { $0.codigo.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            LogoView()
            HStack {
                Image (systemName: "person.circle")
                Text("\(authenticationViewModel.user?.email ?? "No user")")
            }
            NavigationView {
                VStack(alignment: .center){
                Section {
                    List (searchResults, id: \.id) {item in
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
                    .searchable(text: $searchText)
                }
            }.toolbar {
                ToolbarItem (placement: .principal) {
                    HStack {
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
             .navigationBarTitle("Vista Storage", displayMode: .inline)
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
