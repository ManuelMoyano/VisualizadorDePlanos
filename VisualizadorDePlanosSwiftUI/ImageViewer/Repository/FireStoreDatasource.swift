//
//  FireStoreDatasource.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 12/07/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct PlanosDataModel: Decodable, Identifiable {
    @DocumentID var id: String?
    var codigo: String
    var url: String
}

final class PlanosDatasource {
    private let database = Firestore.firestore()
    private let collection = "Planos"
    
    func getAllPlanos(completionBlock: @escaping (Result<[PlanosDataModel], Error>)->Void){
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
            var planos = documents.map { try? $0.data(as: PlanosDataModel.self) }.compactMap { $0 }
            planos.sort {
                $0.codigo < $1.codigo
            }
            completionBlock(.success(planos))
        }
    }
}
