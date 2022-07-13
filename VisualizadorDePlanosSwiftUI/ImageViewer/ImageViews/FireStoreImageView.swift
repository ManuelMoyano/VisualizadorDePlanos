//
//  FireBaseImageView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 13/07/2022.
//

import SwiftUI

struct FireStoreImageView: View {
    let codigo: String
    let ubicacion: String
    var body: some View {
        VStack{
            Text("\(codigo)")
            AsyncImage(url: URL(string: ubicacion)) { image in
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
    }
}

struct FireStoreImageView_Previews: PreviewProvider {
    static var previews: some View {
        FireStoreImageView(codigo: "Codigo", ubicacion: "Codigo de imagen")
    }
}
