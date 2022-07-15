//
//  InitScrollView.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 14/07/2022.
//

import SwiftUI

struct InitScrollView: View {
    let gatosImages = ["Gato2","Gato3","Gato4","Gato5"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var scrollPosition = 0
    
    var body: some View {
        ScrollViewReader { value in
        HStack {
                Button {
                    if scrollPosition > 0 {
                        scrollPosition = scrollPosition - 1
                        value.scrollTo(scrollPosition, anchor: .center)
                    }
                } label: {
                    Image(systemName: "chevron.left.circle")
                        .foregroundStyle(.teal, .gray)
                        .font(.system(size: 42.0))
                }
                ScrollView (.horizontal) {
                        HStack (spacing: 50) {
                            ForEach (0..<gatosImages.count) { i in
                                        Image(gatosImages[i])
                                                .resizable()
                                                .scaledToFit()
                                                .id(i)
                            }
                            .frame(width: 250, height: 350, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.black, lineWidth: 1)
                            )
                        }
                        .onReceive(timer) {time in
                            if scrollPosition < gatosImages.count {
                                    scrollPosition = scrollPosition + 1
                                withAnimation {
                                value.scrollTo(scrollPosition, anchor: .center)
                                }
                            } else {
                                    scrollPosition = 0
                                withAnimation {
                                value.scrollTo(scrollPosition, anchor: .center)
                                }
                            }
                        }
                    }
                Button {
                    if scrollPosition < gatosImages.count {
                            scrollPosition = scrollPosition + 1
                        withAnimation {
                            value.scrollTo(scrollPosition, anchor: .center)
                        }
                    } else {
                            scrollPosition = 0
                        withAnimation {
                            value.scrollTo(scrollPosition, anchor: .center)
                        }
                    }
                } label: {
                    Image(systemName: "chevron.right.circle")
                        .foregroundStyle(.teal, .gray)
                        .font(.system(size: 42.0))
                }
            }
        }
    }
}

struct InitScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InitScrollView()
    }
}
