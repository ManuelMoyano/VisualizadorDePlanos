//
//  StockView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 19/07/2022.
//

import SwiftUI

struct StockView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var stockViewModel: StockViewModel = StockViewModel()
    @State private var searchText = ""
    var searchResults: [StockDataModel] {
        if searchText.isEmpty {
            return stockViewModel.pieces
        } else {
            return stockViewModel.pieces.filter { $0.codigo.localizedCaseInsensitiveContains(searchText) || $0.descripcion.localizedCaseInsensitiveContains(searchText)  }
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
                    List (searchResults, id: \.id) { piece in
                            HStack{
                                Image(systemName: "arrow.right.doc.on.clipboard")
                                Text ("\(piece.codigo)")
                                Text ("\(piece.descripcion)")
                                Spacer()
                                if piece.kanban {
                                    Image (systemName: "circle.fill")
                                        .foregroundColor(.red)
                                    
                                } else {
                                    Image (systemName: "circle.fill")
                                        .foregroundColor(.gray)
                                }
                                
                            }
                            .swipeActions {
                                if piece.kanban {
                                    Button {
                                        stockViewModel.update(codigo: piece)
                                    } label: {
                                        Label("Desactivar Pedido", systemImage: "circle.fill")
                                    }
                                    .tint(.green)
                                } else {
                                    Button {
                                        stockViewModel.update(codigo: piece)
                                    } label: {
                                        Label("Desactivar Pedido", systemImage: "circle.fill")
                                    }
                                    .tint(.red)
                                }
                            }
                    }
                    .searchable(text: $searchText)
                    }
                .toolbar {
                    ToolbarItem (placement: .principal) {
                        HStack {
                            Spacer()
                            Button ("List Files"){
                                Task {
                                    stockViewModel.getAllPieces()
                                }
                            }
                            .frame(height: 30)
                            .foregroundColor(.white)
                            .background(Color.orange.opacity(0.7))
                            .cornerRadius(15)
                        }
                    }
                }
                .navigationBarTitle("Vista Stock", displayMode: .inline)
                }
            }
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(authenticationViewModel: AuthenticationViewModel())
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
