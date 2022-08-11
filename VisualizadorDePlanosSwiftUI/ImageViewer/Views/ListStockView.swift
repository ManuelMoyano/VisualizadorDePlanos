//
//  ListStockView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 20/07/2022.
//

import SwiftUI

struct ListStockView: View {
    @State var searchText = ""
    @StateObject var stockViewModel: StockViewModel = StockViewModel()
    let stockList: [StockDataModel]
    var searchResults: [StockDataModel] {
        if searchText.isEmpty {
            return stockList
        } else {
            return stockList.filter { $0.codigo.localizedCaseInsensitiveContains(searchText) || $0.descripcion.localizedCaseInsensitiveContains(searchText)  }
        }
    }
    
    
    var body: some View {
        List (searchResults, id: \.id) { piece in
                HStack{
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
}

struct ListStockView_Previews: PreviewProvider {
    static var previews: some View {
        ListStockView(searchText: "", stockList: [StockDataModel]())
    }
}
