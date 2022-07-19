//
//  StockDatasource.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 19/07/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct StockDataModel: Decodable, Identifiable {
    @DocumentID var id: String?
    var codigo: String
    var descripcion: String
    var kanban: Bool
}

final class StockDatasource {
    private let database = Firestore.firestore()
    private let collection = "Stock"
    
    func getAllPieces(completionBlock: @escaping (Result<[StockDataModel], Error>)->Void){
        database.collection(collection).addSnapshotListener{ query, error in
            if let error = error {
                print ("Error getting all planos \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            guard let documents = query?.documents.compactMap({ $0 }) else {
                completionBlock(.success([]))
                return
            }
            var stock = documents.map { try? $0.data(as: StockDataModel.self) }.compactMap { $0 }
            stock.sort {
                $0.codigo < $1.codigo
            }
            completionBlock(.success(stock))
        }
    }
}

