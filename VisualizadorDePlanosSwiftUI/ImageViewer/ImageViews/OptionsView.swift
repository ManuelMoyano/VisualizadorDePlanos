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
                Image("Logo MyL")
                .resizable()
                .frame(width: 400
                       , height: 200, alignment: .center)
                .border(.white)
                .cornerRadius(200)
                Button {
                    optionsSheet = .storage
                } label: {
                    HStack{
                    Image(systemName: "doc")
                    Text ("Storage")
                    }
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .font(.system(size: 30))

                Button {
                    optionsSheet = .firestore
                } label: {
                    HStack{
                    Image(systemName: "doc.text")
                    Text ("FireStore")
                    }
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .font(.system(size: 30))
                Spacer()
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
