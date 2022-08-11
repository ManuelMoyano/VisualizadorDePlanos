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
    let rgbColor = Color(red: 1.0, green: 0.5, blue: 0.5)

    
    var body: some View {
        NavigationView{
            VStack{
                LogoView()
                InitScrollView()
                Button {
                    optionsSheet = .storage
                } label: {
                    HStack{
                    Image(systemName: "doc")
                    Text ("Storage")
                    }
                }
                .font(.system(size: 30))
                .frame(width: 300, height: 40)
                .shadow(color: Color.white, radius: 20)
                .scenePadding(.horizontal)
                .foregroundColor(.white)
                .background(Color("ButtonColor"))
                .cornerRadius(8)
                .padding(3)
                Button {
                    optionsSheet = .firestore
                } label: {
                    HStack{
                    Image(systemName: "doc.text")
                    Text ("FireStore")
                    }
                }
                .font(.system(size: 30))
                .frame(width: 300, height: 40)
                .shadow(color: Color.white, radius: 20)
                .scenePadding(.horizontal)
                .foregroundColor(.white)
                .background(Color("ButtonColor"))
                .cornerRadius(8)
                .padding(3)
                Button {
                    optionsSheet = .stock
                } label: {
                    HStack{
                    Image(systemName: "cart")
                    Text ("Stock")
                    }
                }
                .font(.system(size: 30))
                .frame(width: 300, height: 40)
                .shadow(color: Color.white, radius: 20)
                .scenePadding(.horizontal)
                .foregroundColor(.white)
                .background(Color("ButtonColor"))
                .cornerRadius(8)
                .padding(3)
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
                    case .stock:
                        StockView(authenticationViewModel: authenticationViewModel)
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(authenticationViewModel:AuthenticationViewModel())
    }
}
