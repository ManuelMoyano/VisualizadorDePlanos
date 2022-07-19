//
//  StockRepository.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 19/07/2022.
//

import Foundation


final class StockRepository {
    private let stockDatasource: StockDatasource
    
    init(stockDatasource: StockDatasource = StockDatasource()){
        self.stockDatasource = stockDatasource
    }
    func getAllPieces (completionBlock: @escaping (Result<[StockDataModel], Error>)->Void) {
        stockDatasource.getAllPieces(completionBlock: completionBlock)
    }
}
