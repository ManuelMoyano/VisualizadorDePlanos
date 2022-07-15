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
                    ProgressView()
                        .frame(width: 150, height: 150, alignment: .center)
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
