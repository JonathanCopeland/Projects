//
//  Budgets.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import Foundation

class Budgets: ObservableObject {
    @Published var items = [BudgetItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([BudgetItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
