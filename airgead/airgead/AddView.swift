//
//  AddView.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var transactions: Transactions
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var category = ""
    @State private var payee = ""
    @State private var amount = 0.0
    

    var body: some View {
        NavigationView {
            Form {
                HStack (spacing: 2) {
                    Text(Locale.current.currencySymbol ?? "$")
                    TextField("Amount", value: $amount, format: .number)
                        .keyboardType(.decimalPad)
                }
                TextField("Payee", text: $payee)
                TextField("Category", text: $category)

            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = TransactionItem(category: category, payee: payee, amount: amount)
                    transactions.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(transactions: Transactions())
    }
}

