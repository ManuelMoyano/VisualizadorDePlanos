//
//  DataTypes.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 07/07/2022.
//

import Foundation

enum SheetNames: String, Identifiable {
    case loginView
    case registerView
    
//  Esta variable se requiere para poder usarla en el comando sheet
    var id: String {
        return rawValue
    }
}
enum OptionsViewSheets: String, Identifiable {
    case storage
    case firestore
    case stock
    
//  Esta variable se requiere para poder usarla en el comando sheet
    var id: String {
        return rawValue
    }
}


struct Plano: Identifiable {
    var id = UUID()
    var codigo = ""
//    var imageURL = URL(string: "")
}
struct Planos {
    var planos = Plano()
}
