//
//  AddBudgetView.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import SwiftUI

struct AddBudgetView: View {
    
    @ObservedObject var budgets: Budgets
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var limit = 0.0
    

    var body: some View {
        NavigationView {
            Form {
                HStack (spacing: 2) {
                    Text(Locale.current.currencySymbol ?? "$")
                    TextField("Limit", value: $limit, format: .number)
                        .keyboardType(.decimalPad)
                }
                TextField("Name", text: $name)

            }
            .navigationTitle("Add new budget")
            .toolbar {
                Button("Save") {
                    let item = BudgetItem(name: name, limit: limit)
                    budgets.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView(budgets: Budgets())
    }
}

