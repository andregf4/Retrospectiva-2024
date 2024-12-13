//
//  FuncaoView.swift
//  Jornada2024
//
//  Created by Andre Gerez Foratto on 26/09/24.
//

import SwiftUI

struct Technologies: Hashable {
    let image: String
    let descricao: [String]
}

struct FuncaoView: View {
    @State var images: [Technologies] = [
        Technologies(image: "microprocessor", descricao: ["ARDUINO", "ESP8266", "RASPBERRY PI", "", "Gás", "Temperatura", "Pressão", "Altitude", "Umidade", "Luminosidade", "Proximidade", "..."]),
        Technologies(image: "printer", descricao: ["Impressora 3D", "Cortadora a Laser"]),
        Technologies(image: "swift", descricao: ["SwiftUI", "Xcode"]),
        Technologies(image: "arduino", descricao: ["Arduino IDE", "C++"]),
        Technologies(image: "node-red", descricao: ["NODE-RED", "", "Conectividade", "IoT", "API Rest"]),
        Technologies(image: "cloud", descricao: ["CLOUDANT (IBM)", "Banco de Dados"])
    ]
    let columns = [
        GridItem(.fixed(CGFloat(90))),
        GridItem(.fixed(CGFloat(90))),
        GridItem(.fixed(CGFloat(90)))
    ]
    @State var showPopUp = false
    @State var description: [String] = []
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 400)
                        .offset(CGSize(width: 10.0, height: -10.0))
                        .opacity(0.4)
                        .blur(radius: 3.0)
                    VStack {
                        Text("**INSTRUTOR** no projeto")
                        Image("hackatruck")
                            .resizable()
                            .frame(width: 250, height: 80)
                        Text("Laboratório móvel dentro de um caminhão itinerante que circula pelos estados brasileiros desde 2015.")
                            .multilineTextAlignment(.center)
                            .frame(width: 300)
                        Image("truck")
                            .resizable()
                            .frame(width: 250, height: 100)
                    }
                    .frame(width: 350, height: 400)
                    .background(.white)
                    .border(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing), width: 5)
                }
                
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(images, id: \.self) { i in
                        Image(i.image)
                            .resizable()
                            .frame(width: 60, height: 50)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: -10)
                            .onTapGesture {
                                showPopUp = true
                                description = i.descricao
                            }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Função")
        .toolbarBackground(Color.berinjela.opacity(0.5), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .blur(radius: showPopUp ? 10 : 0)
        .popup(isPresented: $showPopUp) {
            VStack {
                ForEach(description, id: \.self) { d in
                    Text(d)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .font(.custom("ChakraPetch-Regular", size: 20))
                }

                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                        .frame(width: 85, height: 60)
                        .offset(CGSize(width: 4.0, height: -1.0))
                        .opacity(0.4)
                        .blur(radius: 3.0)

                    Text("Voltar")
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 20)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .padding()
            .frame(width: 350)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(LinearGradient(colors: [.berinjela, .white, .white, .white, .berinjela], startPoint: .leading, endPoint: .trailing))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing), lineWidth: 3)
            )

        }
    }
}

#Preview {
    FuncaoView()
}
