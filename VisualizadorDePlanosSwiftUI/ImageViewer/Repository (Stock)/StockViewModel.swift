//
//  StockViewModel.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 19/07/2022.
//

import Foundation

final class StockViewModel: ObservableObject {
    @Published var pieces: [StockDataModel] = []
    @Published var messageError: String?
    private let stockRepository: StockRepository
    
    init(stockRepository: StockRepository = StockRepository()) {
        self.stockRepository = stockRepository
    }
    
    func getAllPieces () {
        stockRepository.getAllPieces { [weak self] result in
            switch result {
            case .success(let stockModels):
                self?.pieces = stockModels
            case.failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func update(codigo: StockDataModel){
        let updateStock = StockDataModel (id: codigo.id, codigo: codigo.codigo, descripcion: codigo.descripcion, kanban: codigo.kanban ? false : true)
        stockRepository.updateStock(codigo: updateStock)
    }
}
