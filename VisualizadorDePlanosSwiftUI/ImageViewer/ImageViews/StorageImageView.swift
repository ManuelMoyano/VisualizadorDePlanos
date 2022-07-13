//
//  ImageView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 10/07/2022.
//

import SwiftUI

struct StorageImageView: View {
@ObservedObject var storageManager = StorageManager()
var ubicacion: String
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: storageManager.imageURL?.absoluteString ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "doc")
                        .resizable()
                        .scaledToFit()
                        .font(.system(size: 8, weight: .ultraLight))
                }
            .padding(10)
            .scaledToFit()
        }
            .onAppear {
                Task {
                    await storageManager.loadImageFromFirebase(ubicacion: ubicacion)
                }
            }
    }
}

struct StorageImageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageImageView(ubicacion: "")
    }
}
