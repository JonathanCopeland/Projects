//
//  TransactionItem.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import Foundation

struct TransactionItem : Identifiable, Codable, Equatable {
    var id = UUID()
    var category: String
    var payee: String
    var amount: Double
}
