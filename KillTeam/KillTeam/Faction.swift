//
//  Faction.swift
//  KillTeam
//
//  Created by Jonathan Copeland on 08/04/2023.
//

import Foundation

struct Faction: Codable, Identifiable {
    let id = UUID()
    let factionid: String
    let factionname: String
    let description: String
    
}

