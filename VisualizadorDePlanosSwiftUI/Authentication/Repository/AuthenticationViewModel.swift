//
//  AuthenticationViewModel.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 08/07/2022.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var user: User?
    @Published var messageError: String?
    private let authentificationRepository: AuthenticationRepository
    
    init (authentificationRepository: AuthenticationRepository = AuthenticationRepository()){
        self.authentificationRepository = authentificationRepository
        getCurrentUser()
    }
    
    func creatNewUser (email: String, password: String){
        authentificationRepository.createNewUser(email: email, password: password) {[weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    func getCurrentUser () {
        self.user = authentificationRepository.getCurrentUser()
    }
    func logOut() {
        do {
        try authentificationRepository.logOut()
            self.user = nil
        } catch {
            print ("Error logout")
        }
    }
    func login(email: String, password: String){
        authentificationRepository.login(email: email, password: password) {[weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
}
