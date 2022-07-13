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
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center){
                HStack {
                    Button ("Logout"){
                        authenticationViewModel.logOut()
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    Spacer()
                    Button ("List Files"){
                        Task {
                            await storageManager.listItems()
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
        }
            .navigationBarTitle("Vista de Planos")
            .navigationBarHidden(true)
        }
    }
}

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageView(authenticationViewModel: AuthenticationViewModel())
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
