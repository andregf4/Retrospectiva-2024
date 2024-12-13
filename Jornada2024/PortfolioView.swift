//
//  PortfolioView.swift
//  Jornada2024
//
//  Created by Andre Gerez Foratto on 26/09/24.
//

import SwiftUI

struct Projetos: Hashable {
    let projeto: String
    let hyperlink: String
    let capa: String
}

struct PortfolioView: View {
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                Spacer()
                AutoScroller(imageNames: [
                    Projetos(projeto: "portfolioCapa", hyperlink: "https://github.com/andregf4", capa: "apple"),
                    Projetos(projeto: "1", hyperlink: "https://github.com/andregf4/ColorArts_swiftui", capa: "10"),
                    Projetos(projeto: "2", hyperlink: "https://github.com/andregf4/ChartsArts_swiftui", capa: "20"),
                    Projetos(projeto: "3", hyperlink: "https://github.com/andregf4/CoincapAPI_swiftui", capa: "30"),
                    Projetos(projeto: "4", hyperlink: "https://github.com/andregf4/RickAndMortyAPI_swiftui", capa: "40"),
                    Projetos(projeto: "5", hyperlink: "https://github.com/andregf4/Papelitos_swiftui", capa: "50"),
                    Projetos(projeto: "6", hyperlink: "https://github.com/andregf4/OscarJSON_swiftui", capa: "60"),
                    Projetos(projeto: "7", hyperlink: "https://github.com/andregf4/Genius_swiftui", capa: "70"),
                    Projetos(projeto: "8", hyperlink: "https://github.com/andregf4/MapQuiz_swiftui", capa: "80")
                ])
            }
        }
        .navigationTitle("Portfólio")
        .toolbarBackground(Color.berinjela.opacity(0.5), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct AutoScroller: View {
    
    var imageNames: [Projetos]
    
    @State private var selectedImageIndex: Int = 0

    var body: some View {
        ZStack {
            Color.gray.opacity(0)
                .ignoresSafeArea()

            VStack {
                TabView(selection: $selectedImageIndex) {
                    ForEach(0..<imageNames.count, id: \.self) { index in
                        ZStack(alignment: .topLeading) {
                            Image("\(imageNames[index].projeto)")
                                .resizable()
                                .tag(index)
                                .frame(width: 350, height: 200)
                                .onTapGesture {
                                    
                                }
                        }
                        .shadow(radius: 20)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<imageNames.count, id: \.self) { index in
                        Capsule()
                            .fill(Color.berinjela.opacity(selectedImageIndex == index ? 1 : 0.33))
                            .frame(width: 30, height: 8)
                            .onTapGesture {
                                selectedImageIndex = index
                            }
                    }
                }
                .padding(.top, -40)
                
                VStack {
                    TabView(selection: $selectedImageIndex) {
                        ForEach(0..<imageNames.count, id: \.self) { index in
                            VStack {
                                Image("\(imageNames[index].capa)")
                                    .resizable()
                                    .frame(width: 150, height: 330)
                                    .cornerRadius(30)
                                Link(destination: URL(string: "\(imageNames[index].hyperlink)")!, label: {
                                    Image("github")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                })
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
}
