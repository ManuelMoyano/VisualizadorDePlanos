//
//  AuthenticationRepository.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 07/07/2022.
//

import Foundation

final class AuthenticationRepository {
    private let autthenticationFirebaseDatasource: AuthentificationFirebaseDatasource
    
    init (autthenticationFirebaseDatasource: AuthentificationFirebaseDatasource = AuthentificationFirebaseDatasource()) {
        self.autthenticationFirebaseDatasource = autthenticationFirebaseDatasource
    }
    func createNewUser (email: String, password: String, completionBlock: @escaping (Result<User, Error>) ->Void) {
        autthenticationFirebaseDatasource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    func getCurrentUser ()-> User? {
        autthenticationFirebaseDatasource.getCurrentUser()
    }
    func logOut () throws {
        try autthenticationFirebaseDatasource.logOut()
    }
    func login (email: String, password: String, completionBlock: @escaping (Result<User, Error>) ->Void) {
        autthenticationFirebaseDatasource.login(email: email, password: password, completionBlock: completionBlock)
    }
    
    
    
}
