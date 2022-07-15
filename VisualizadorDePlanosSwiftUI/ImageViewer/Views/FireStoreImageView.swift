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
                    ProgressView()
                        .frame(width: 150, height: 150, alignment: .center)
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
