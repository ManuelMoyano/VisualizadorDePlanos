//
//  FireStoreViewModel.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 12/07/2022.
//

import Foundation

final class PlanosViewModel: ObservableObject {
    @Published var planos: [PlanosDataModel] = []
    @Published var messageError: String?
    private let planosRepository: PlanosRepository
    
    init(planosRepository: PlanosRepository = PlanosRepository()) {
        self.planosRepository = planosRepository
    }
    
    func getAllPlanos () {
        planosRepository.getAllPlanos { [weak self] result in
            switch result {
            case .success(let planosModels):
                self?.planos = planosModels
            case.failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
}
