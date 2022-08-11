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
    @State private var activePieces = false

    
    
    
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
                        if activePieces {
                            ListStockView(stockList: stockViewModel.pieces.filter{$0.kanban})
                        } else {
                            ListStockView(stockList: stockViewModel.pieces)
                        }
                    }
                .toolbar {
                    ToolbarItem (placement: .principal) {
                        HStack {
                            Button ("Active Pieces"){
                                activePieces.toggle()
                            }
                            .frame(height: 30)
                            .foregroundColor(.white)
                            .background(activePieces ? Color.red.opacity(0.8) : Color.orange.opacity(0.7))
                            .cornerRadius(15)
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
