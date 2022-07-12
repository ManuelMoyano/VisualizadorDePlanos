//
//  ImageView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 10/07/2022.
//

import SwiftUI

struct ImageView: View {
@StateObject var storageManager = StorageManager()
var ubicacion: String
    
    var body: some View {
        AsyncImage(url: URL(string: storageManager.imageURL?.absoluteString ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .padding(10)
            .scaledToFit()
            .onAppear {
                Task {
                    await storageManager.loadImageFromFirebase(ubicacion: ubicacion)
                }
            }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(ubicacion: "")
    }
}
