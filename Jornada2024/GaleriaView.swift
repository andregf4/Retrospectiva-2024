//
//  GaleriaView.swift
//  Jornada2024
//
//  Created by Andre Gerez Foratto on 26/09/24.
//

import SwiftUI

struct Galeria: Identifiable {
    let cidade: String
    let id: Int
    let foto: [String]
}

struct GaleriaView: View {
    
    @State var galerias: [Galeria] = [
        Galeria(cidade: "Marabá, PA", id: 1, foto: ["11", "12","13"]),
        Galeria(cidade: "Foz do Iguaçu, PR", id: 2, foto: ["21", "22", "23"]),
        Galeria(cidade: "Palhoça, SC", id: 3, foto: ["31", "32", "33"]),
        Galeria(cidade: "Chapecó, SC", id: 4, foto: ["41", "42", "43"]),
        Galeria(cidade: "Vitória, ES", id: 5, foto: ["51", "52", "53"]),
        Galeria(cidade: "Campina Grande, PB", id: 6, foto: ["61", "62", "63"]),
        Galeria(cidade: "Juazeiro do Norte, CE", id: 7, foto: ["71", "72", "73"]),
        Galeria(cidade: "Juazeiro, BA", id: 8, foto: ["81", "82", "83"]),
        Galeria(cidade: "Natal, RN", id: 9, foto: ["91", "92", "93"]),
    ]
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.7)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    ForEach(galerias) { galeria in
                        VStack {
                            Text(galeria.cidade)
                                .padding(.leading)
                                .font(.custom("ChakraPetch-Regular", size: 30))
                                .shadow(radius: 5)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(galeria.foto, id: \.self) { foto in
                                        Image(foto)
                                            .resizable()
                                        //                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 250, height: 300)
                                            .border(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing), width: 2)
                                            .padding(.bottom)
                                    }
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Galeria")
        .toolbarBackground(Color.berinjela.opacity(0.5), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    GaleriaView()
}
