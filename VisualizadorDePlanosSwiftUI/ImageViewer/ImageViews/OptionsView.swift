//
//  OptionsView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 12/07/2022.
//

import SwiftUI

struct OptionsView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var optionsSheet: OptionsViewSheets?
    
    var body: some View {
        NavigationView{
            VStack{
                Button ("Storage"){
                    optionsSheet = .storage
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                Button ("FireStore"){
                    optionsSheet = .firestore
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
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
                        }
                    }
                }
                .sheet(item: $optionsSheet) { sheet in
                    switch sheet {
                    case .storage:
                        StorageView(authenticationViewModel: authenticationViewModel)
                    case .firestore:
                        FireStoreView(authenticationViewModel:authenticationViewModel)
                    }
                }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(authenticationViewModel:AuthenticationViewModel())
    }
}
