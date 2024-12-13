//
//  ViagensView.swift
//  Jornada2024
//
//  Created by Andre Gerez Foratto on 26/09/24.
//

import SwiftUI
import MapKit

struct Universidades: Identifiable {
    let id: Int
    let universidade: String
    let cidade: String
    let lat: Double
    let long: Double
}

struct ViagensView: View {
    
    @State var universidades: [Universidades] = [
        Universidades(id: 1, universidade: "UNIFESSPA", cidade: "Marabá, PA", lat: -5.3550975, long: -49.0693045),
        Universidades(id: 2, universidade: "PTI", cidade: "Foz do Iguaçu, PR", lat: -25.4353111, long: -54.6002632),
        Universidades(id: 3, universidade: "SENAC-SC", cidade: "Palhoça, SC", lat: -27.63607, long: -48.6563438),
        Universidades(id: 4, universidade: "UNOCHAPECÓ", cidade: "Chapecó, SC", lat: -27.093903, long: -52.6690479),
        Universidades(id: 5, universidade: "UFES", cidade: "Vitória, ES", lat: -20.2768594, long: -40.3079969),
        Universidades(id: 6, universidade: "UNIFACISA", cidade: "Campina Grande, PB", lat: -7.2499503, long: -35.8728003),
        Universidades(id: 7, universidade: "UFCA", cidade: "Juazeiro do Norte, CE", lat: -7.2330741, long: -39.3723393),
        Universidades(id: 8, universidade: "UNIVASF", cidade: "Juazeiro, BA", lat: -9.4126997, long: -40.5178074),
        Universidades(id: 9, universidade: "IFRN", cidade: "Natal, RN", lat: -5.8118025, long: -35.2065771)
    ]
    
    @State var origem = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -5.3550975, longitude: -49.0693045), span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)))
    
    @State var idAux = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var tempoSobrando = 4
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 550)
                        .offset(CGSize(width: 10.0, height: -10.0))
                        .opacity(0.4)
                        .blur(radius: 3.0)
                    Map(position: $origem) {
                        ForEach(universidades) { u in
                            Annotation(u.universidade, coordinate: CLLocationCoordinate2D(latitude: u.lat, longitude: u.long)) {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
                .border(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing), width: 5)
                .frame(width: 350, height: 550)
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(universidades[idAux].id).")
                            Text(universidades[idAux].universidade)
                        }
                        .bold()
                        .font(.custom("ChakraPetch-Regular", size: 30))
                        Text(universidades[idAux].cidade)
                    }
                    Spacer()
                    Button {
                        idAux += 1
                        if idAux >= universidades.count {
                            idAux = 0
                        }
                        withAnimation(.easeInOut(duration: 6)) {
                            origem = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: universidades[idAux].lat, longitude: universidades[idAux].long), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)))
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing))
                                .opacity(0.8)
                                .frame(width: 70)
                            Image(systemName: "arrowshape.right.fill")
                                .foregroundStyle(.black)
                                .font(.system(size: 40))
                        }
                    }
                    .onReceive(timer) { _ in
                        if tempoSobrando > 0 {
                            tempoSobrando -= 1
                        } else {
                            withAnimation(.easeInOut(duration: 6)) {
                                origem = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: universidades[idAux].lat, longitude: universidades[idAux].long), span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)))
                            }
                        }
                    }
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle("Viagens")
        .toolbarBackground(Color.berinjela.opacity(0.5), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    ViagensView()
}
