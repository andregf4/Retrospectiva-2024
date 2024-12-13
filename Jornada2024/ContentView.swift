//
//  ContentView.swift
//  Jornada2024
//
//  Created by Andre Gerez Foratto on 25/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var degreesRotating: Double = 0

    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                    .opacity(0.7)
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        Circle()
                            .fill(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 350)
                            .rotationEffect(.degrees(degreesRotating))
                            .onAppear {
                                withAnimation(.linear(duration: 1)
                                    .speed(0.3).repeatForever(autoreverses: false)) {
                                        degreesRotating = 360.0
                                    }
                            }
                        Image("foto_perfil")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 300)
                        Text("André Gerez Foratto")
                            .bold()
                            .padding()
                            .background(.white)
                            .cornerRadius(15)
                            .font(.system(size: 25))
                            .padding(.top, 300)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                                    .frame(height: 60)
                                    .padding(.top, 300)
                            )
                    }
                    .padding(.bottom, 50)
                    VStack {
                        HStack {
                            NavigationLink(destination: FuncaoView()) {
                                Text("Função")
                                    .frame(width: 120, height: 70)
                                    .padding()
                                    .background(.white)
                                    .border(LinearGradient(colors: [.blue, .berinjela], startPoint: .leading, endPoint: .trailing), width: 5)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            }
                            NavigationLink(destination: ViagensView()) {
                                Text("Viagens")
                                    .frame(width: 120, height: 70)
                                    .padding()
                                    .background(.white)
                                    .border(LinearGradient(colors: [.berinjela, .pink], startPoint: .leading, endPoint: .trailing), width: 5)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -10, y: 10)
                            }
                        }
                        HStack {
                            NavigationLink(destination: GaleriaView()) {
                                Text("Galeria")
                                    .frame(width: 120, height: 70)
                                    .padding()
                                    .background(.white)
                                    .border(LinearGradient(colors: [.blue, .berinjela], startPoint: .leading, endPoint: .trailing), width: 5)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: -10)
                            }
                            NavigationLink(destination: PortfolioView()) {
                                Text("Portfólio")
                                    .frame(width: 120, height: 70)
                                    .padding()
                                    .background(.white)
                                    .border(LinearGradient(colors: [.berinjela, .pink], startPoint: .leading, endPoint: .trailing), width: 5)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -10, y: -10)
                            }
                        }
                    }
                    .font(.custom("ChakraPetch-Regular", size: 25))
                    .tint(.black)
                    .padding(.bottom, 50)
                    HStack {
                        Image("linkedin")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        Image("github")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        Image("instagram")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .shadow(radius: 10)
            }
        }
        .accentColor(.black)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
