//
//  ContentView.swift
//  France holiday '23
//
//  Created by Jonathan Copeland on 09/05/2023.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.9254399114669, longitude: -0.7045975762512815), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    
    let locations = [
        Location(name: "Angers", coordinate: CLLocationCoordinate2D(latitude: 47.50225278954074, longitude: -0.5425492421779458)),
        Location(name: "Grez-Neuville", coordinate: CLLocationCoordinate2D(latitude: 47.60042900903816, longitude: -0.6755224368954869)),
        Location(name: "Écluse \"Montreuil-sur-Maine\"", coordinate: CLLocationCoordinate2D(latitude: 47.661340578167405, longitude: -0.6589617083336854)),
        Location(name: "Chenillé-Changé", coordinate: CLLocationCoordinate2D(latitude: 47.710941992843544, longitude: -0.6158708409485415)),
        Location(name: "Château-Gontier", coordinate: CLLocationCoordinate2D(latitude: 47.8203357529265, longitude: -0.7100228761267818)),
        Location(name: "Entrammes", coordinate: CLLocationCoordinate2D(latitude: 48.010546533347934, longitude: -0.6696720039075361)),
        Location(name: "Laval", coordinate: CLLocationCoordinate2D(latitude: 48.09775484381099, longitude: -0.7665140972337262)),
        Location(name: "Montgiroux", coordinate: CLLocationCoordinate2D(latitude: 48.23232232022015, longitude: -0.6535316550198376)),
        Location(name: "Mayenne", coordinate: CLLocationCoordinate2D(latitude:   48.30114490651161, longitude: -0.6323672750901277))
    ]

   
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .ignoresSafeArea()
            .bottomSheet(presentationDetents: [.medium, .large, .height(70)], isPresented: .constant(true), sheetCornerRadius: 20) {
                Text("Hello")
            } onDismiss: {}
        }



    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//            .sheet(isPresented: .constant(true)) {
//                VStack(spacing: 15){
//                    Text("Hello")
//                }
//                .padding()
//                .padding(.top)
//            }



//NavigationView {
//    Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//        MapAnnotation(coordinate: location.coordinate) {
//            NavigationLink {
//                Text(location.name)
//            } label: {
//                Circle()
//                    .stroke(.red, lineWidth: 3)
//                    .frame(width: 20, height: 20)
//            }
//        }
//    }
//    .ignoresSafeArea()
//
//}
