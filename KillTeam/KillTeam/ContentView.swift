//
//  ContentView.swift
//  KillTeam
//
//  Created by Jonathan Copeland on 08/04/2023.
//

import SwiftUI

struct ContentView: View {

    let factions: [String: Faction] = Bundle.main.decode("compendium.json")

    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
