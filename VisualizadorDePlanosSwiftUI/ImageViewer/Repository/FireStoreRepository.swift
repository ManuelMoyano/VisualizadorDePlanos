//
//  FireStoreRepository.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 12/07/2022.
//

import Foundation

final class PlanosRepository {
    private let planosDatasource: PlanosDatasource
    
    init(planosDatasource: PlanosDatasource = PlanosDatasource()){
        self.planosDatasource = planosDatasource
    }
    func getAllPlanos (completionBlock: @escaping (Result<[PlanosDataModel], Error>)->Void) {
        planosDatasource.getAllPlanos(completionBlock: completionBlock)
    }
}
