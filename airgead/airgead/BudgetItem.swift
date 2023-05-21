//
//  BudgetItem.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import Foundation

struct BudgetItem : Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var limit: Double
}
