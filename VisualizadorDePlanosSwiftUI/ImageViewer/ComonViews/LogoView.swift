//
//  LogoView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 14/07/2022.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack{
            Image("Logo MyL")
            .resizable()
            .frame(width: 400
                   , height: 200, alignment: .center)
            .border(.white)
            .cornerRadius(200)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
